import { StyleSheet, View, Text, Image, TouchableOpacity, Alert} from 'react-native'
import { router, useGlobalSearchParams } from 'expo-router'
import HeaderBar from '@/components/HeaderBar';
import { SafeAreaView, useSafeAreaInsets } from 'react-native-safe-area-context';
import ViewShot, { captureRef } from 'react-native-view-shot';
import * as MediaLibrary from 'expo-media-library';
import { useRef, useState } from 'react';

export default function ViewImage () {
    const { result, uri, uri2, uri3 } = useGlobalSearchParams<{ result: string; uri: string; uri2?: string; uri3?: string}>();
    const parsedResult = result ? JSON.parse(result) : null;
    const insets = useSafeAreaInsets();
    const resultCardRef = useRef<ViewShot>(null);

    const images = [
        {uri, label: "Whole Fish"},
        uri2 && uri2 !== '' && uri2 !== 'skipped' ? {uri: uri2, label: "Gills"} : null,
        uri3 && uri3 !== '' ? { uri: uri3, label: "Eyes"}: null,
    ]. filter(Boolean) as { uri: string; label:string}[];

    const gradeColor = (grade: string) => {
        if (grade === 'HIGH') return '#16a34a';
        if (grade === 'MEDIUM') return '#ca8a04';
        return '#dc2626';
    };
    const grade = parsedResult?.quality?.toUpperCase() ?? 'N/A';

    const saveResult = async () => {
    try {
      const { status } = await MediaLibrary.requestPermissionsAsync();
      if (status !== 'granted') {
        Alert.alert('Permission required', 'Allow access to save to gallery.');
        return;
      }
      const capturedUri = await captureRef(resultCardRef, {
        format: 'jpg',
        quality: 0.95,
      });

        await MediaLibrary.saveToLibraryAsync(capturedUri);
            Alert.alert('Saved!', 'Result saved to your gallery.');
        } catch (err) {
            Alert.alert('Error', 'Failed to save result.');
        }
    };

    if (!parsedResult || !parsedResult.species || parsedResult.species === 'Unknown') {
        return (
            <SafeAreaView edges={['top']} className='flex-1 bg-primary items-center justify-center px-6'>
                <Text className='text-2xl font-bold text-[#0B1D51] text-center mb-2'>
                    Unknown Species
                </Text>
                <Text className='text-gray-500 text-center mb-8'>
                    We could not identify the fish in your image. Please make sure the fish is clearly visible and try again.
                </Text>
                <View className='flex-row'>
                    <TouchableOpacity
                        onPress={() => router.push('/scan/capture')}
                        style={[styles.button, { flex: 0, paddingHorizontal: 24 }]}
                    >
                        <Text className='text-[#0B1D51] font-semibold'>Try Again</Text>
                    </TouchableOpacity>
                    <TouchableOpacity
                        onPress={() => router.push('/home')}
                        style={[styles.button, { flex: 0, paddingHorizontal: 24, marginLeft: 8 }]}
                    >
                        <Text className='text-[#0B1D51] font-semibold'>Go Home</Text>
                    </TouchableOpacity>
                </View>
            </SafeAreaView>
        );
    }

    return (
        <SafeAreaView edges={['top']} className='flex-1 bg-primary items-center justify-start pt-8'>
            <SafeAreaView className='flex-1 bg-primary w-full max-h-0' />
            <HeaderBar onPress={() => router.back()} title='Results' />

            <ViewShot ref={resultCardRef} style={{ width: '90%', marginVertical: 8 }}>
                <View className="flex-row mb-3 bg-primary" style={{ justifyContent: "center" }}>
                    {images.map((img, i) => (
                        <View key={i} style={{
                            width: images.length === 1 ? 250 : images.length === 2 ? 160: 100,
                             marginHorizontal: 2
                            }}>
                            <Text className="text-xs text-center text-black mb-1">{img.label}</Text>
                            <Image
                                source={{ uri: img.uri }}
                                style={{ width: '100%', aspectRatio: 1, borderRadius: 8 }}
                                resizeMode="cover"
                            />
                        </View>
                    ))}
                    </View>

                    <View className="rounded-xl bg-secondary border-2 border-tertiary px-6 py-4">

                    {/* Species & Grade */}
                    <View className="flex-row justify-between items-center mb-2">
                        <Text className="font-bold text-lg text-[#0B1D51]">
                            {parsedResult?.species ?? 'Unknown Species'}
                        </Text>

                    </View>

                    {/* Overall Score */}
                    <View className="items-center mb-3">
                        <Text className="text-gray-500 text-sm">Fish Quality</Text>
                        <Text style={{ color: gradeColor(grade), fontWeight: 'bold', fontSize: 16 }}>
                            {grade}
                        </Text>
                    </View>

                    {/*Scores */}
                    {[
                        { label: 'Body', value: parsedResult?.body_score },
                        { label: 'Gills', value: parsedResult?.gill_score },
                        { label: 'Eyes', value: parsedResult?.eye_score },
                        { label: 'Rule Score', value: parsedResult?.rule_score },
                        { label: 'ML Score', value: parsedResult?.ml_score },
                    ].map(({ label, value }) => (
                        <View key={label} className='flex-row justify-between mb-1'>
                        <Text className='text-gray-600'>{label}</Text>
                        <Text className='font-semibold'>
                            {value != null ? value.toFixed(1) : 'N/A'}
                        </Text>
                        </View>
                    ))}

                    {/* Footer */}
                    <Text className="text-gray-400 text-xs text-center mt-3">
                        {new Date().toLocaleDateString('en-PH')} • IsdaOK
                    </Text>
                    </View>
            </ViewShot>

                {/* Buttons */}
                <SafeAreaView edges={['bottom']} className="w-full py-2 pb-2">
                    <View className='flex-row items-center justify-end px-4'>
                    <TouchableOpacity onPress={() => router.push('/home')} style={styles.button}>
                        <Text>Back to Sea</Text>
                    </TouchableOpacity>
                    <TouchableOpacity onPress={() => router.push('/scan/capture')} style={styles.button}>
                        <Text>Scan Again</Text>
                    </TouchableOpacity>
                    <TouchableOpacity onPress={saveResult} style={styles.button}>
                        <Text>Save Result</Text>
                    </TouchableOpacity>
                    </View>
                </SafeAreaView>
        </SafeAreaView>
  );
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