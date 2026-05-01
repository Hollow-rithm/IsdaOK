import { StyleSheet, View, Text, Image, ScrollView, TouchableOpacity, Alert } from 'react-native'
import { router, useGlobalSearchParams } from 'expo-router'
import HeaderBar from '@/components/HeaderBar';
import { SafeAreaView, useSafeAreaInsets } from 'react-native-safe-area-context';
import ViewShot, { captureRef } from 'react-native-view-shot';
import * as MediaLibrary from 'expo-media-library';
import { useRef } from 'react';



export default function ViewImage () {
    const { result, uri, uri2, uri3 } = useGlobalSearchParams<{ result: string; uri: string; uri2?: string; uri3?: string}>();
    const parsedResult = result ? JSON.parse(result) : null;
    const insets = useSafeAreaInsets();
    const score = Math.floor(Math.random() * 100);
    const resultRef = useRef(null);

    const downloadResult = async () => {
        try{
            const uri = await captureRef(resultRef, {
                format: 'jpg',
                quality: 0.9
            });
            await MediaLibrary.saveToLibraryAsync(uri);
            Alert.alert('Saved', 'Result saved to your library')
        } catch (err) {
            Alert.alert('Error', 'Failed to Save Result');
        }
    }

    const gradeColor = (grade: string) => {
        if (grade === 'HIGH') return '#16a34a';
        if (grade === 'MEDIUM') return '#ca8a04';
        return '#dc2626';
    };

     const grade = parsedResult?.quality?.toUpperCase() ?? 'N/A';

    return (
        <SafeAreaView edges={['top']} className='flex-1 bg-primary items-center'>
            <SafeAreaView className='flex-1 bg-primary w-full max-h-0'>
            </SafeAreaView>

            {uri && (
                <View style={{ flex: 1, flexDirection: ( uri2 || uri3 ) ? 'row' : 'column', alignItems: 'center', paddingHorizontal: 12 }}>
                <View style={{flex: 1 , alignItems: "center"}}>
                    <Text className='text-sm font-semibold mb-1'>Whole Fish</Text>
                    <Image source={{ uri }} style={{ width: '100%', aspectRatio: 1}} resizeMode="contain"/>
                </View>
                {uri2 && (
                    <View style={{ flex: 1, alignItems: 'center' }}>
                    <Text className='text-sm font-semibold mb-1'>Gills</Text>
                    <Image source={{ uri: uri2 }} style={{ width: '100%', aspectRatio: 1 }} resizeMode="contain"/>
                    </View>
                )}
                {uri3 && (
                    <View style={{ flex: 1, alignItems: 'center' }}>
                    <Text className='text-sm font-semibold mb-1'>Eyes</Text>
                    <Image source={{ uri: uri3 }} style={{ width: '100%', aspectRatio: 1 }} resizeMode="contain"/>
                    </View>
                )}
                </View>
            )}

            <View className='flex-1 bg-primary justify-center items-center max-h-24'>
                <Text className='text-3xl font-extrabold'>Surface Quality Score:</Text>
                <Text className='text-3xl font-extrabold'>{score}</Text>
            </View>

            {parsedResult && (
                <ScrollView
                className="flex-1 w-10/12 rounded-xl bg-secondary py-2 px-6 mb-2 overflow-hidden border-2 border-tertiary"
                contentContainerStyle={{ paddingBottom: insets.bottom + 16 }}
                >
                <Text className='mb-3 font-bold text-lg'>Results</Text>

                <Text className='font-semibold text-base mb-1'>
                    Species: <Text className='font-normal'>{parsedResult.species ?? 'Unknown'}</Text>
                </Text>

                <Text className='font-semibold mt-2 mb-1'>Scores:</Text>

                {[
                    { label: 'Body', value: parsedResult.body_score },
                    { label: 'Gills', value: parsedResult.gill_score },
                    { label: 'Eyes', value: parsedResult.eye_score },
                    { label: 'Tail', value: parsedResult.tail_score },
                    { label: 'Rule Score', value: parsedResult.rule_score },
                    { label: 'ML Score', value: parsedResult.ml_score },
                ].map(({ label, value }) => (
                    <View key={label} className='flex-row justify-between mb-1'>
                    <Text className='text-gray-600'>{label}</Text>
                    <Text className='font-semibold'>
                        {value != null ? value.toFixed(1) : 'N/A'}
                    </Text>
                    </View>
                ))}
                </ScrollView>
            )}

                <SafeAreaView edges={['bottom']} className="w-full py-2 pb-2">
                    <View className={'flex-row items-center justify-end px-4'}>

                        <TouchableOpacity onPress={() => router.push('/home')} style={styles.button}>
                            <Text>Back to Sea</Text>
                        </TouchableOpacity>

                        <TouchableOpacity onPress={() => router.push('/scan/capture')} style={styles.button} >
                            <Text className=''>Scan Again</Text>
                        </TouchableOpacity>

                        <TouchableOpacity onPress={downloadResult} style={styles.button}>
                            <Text>Download</Text>
                        </TouchableOpacity>

                    </View>
                </SafeAreaView>
            

            <HeaderBar onPress={() => router.back()} title='Fish' />

        </SafeAreaView>
    )
}

const styles = StyleSheet.create({
    button: {
        flex: 1,
        height: 36,
        borderRadius: 8,
        backgroundColor: '#ffffff',
        borderWidth: 2,
        borderColor: '#000000',
        justifyContent: 'center',
        alignItems: 'center',
        marginHorizontal: 3
    }
});