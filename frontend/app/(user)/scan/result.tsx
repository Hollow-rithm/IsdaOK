import { StyleSheet, View, Text, Image, TouchableOpacity, Alert, ScrollView } from 'react-native'
import { router, useGlobalSearchParams } from 'expo-router'
import HeaderBar from '@/components/HeaderBar';
import { SafeAreaView} from 'react-native-safe-area-context';
import ViewShot, { captureRef } from 'react-native-view-shot';
import * as MediaLibrary from 'expo-media-library';
import { useRef, useEffect } from 'react';
import { useSettings } from '@/context/settingsContext';

const ScoreBar = ({ label, value }: { label: string; value: number | null | undefined }) => {
    const score = value ?? 0;
    const barColor = score >= 75 ? '#16a34a' : score >= 50 ? '#ca8a04' : '#dc2626';

    return (
        <View className="mb-3">
            <View className="flex-row justify-between mb-1">
                <Text className="text-sm text-gray-600">{label}</Text>
                <Text className="text-sm font-semibold text-[#0B1D51]">
                    {value != null ? value.toFixed(1) : 'N/A'}
                </Text>
            </View>
            <View className="w-full h-2 bg-gray-200 rounded-full overflow-hidden">
                <View style={{
                    width: `${Math.min(score, 100)}%`,
                    height: '100%',
                    backgroundColor: barColor,  
                    borderRadius: 999
                }} />
            </View>
        </View>
    );
};

export default function ViewImage () {
    const { result, uri, uri2, uri3 } = useGlobalSearchParams<{ result: string; uri: string; uri2?: string; uri3?: string}>();
    const parsedResult = result ? JSON.parse(result) : null;
    const resultCardRef = useRef<ViewShot>(null);
    const { settings } = useSettings();

    const getRawImages = () => {
        return [
            {uri, label: "Whole Fish"},
            uri2 && uri2 !== '' && uri2 !== 'skipped' ? {uri: uri2, label: "Gills"} : null,
            uri3 && uri3 !== '' ? { uri: uri3, label: "Eyes"}: null,
        ].filter(Boolean) as { uri: string; label: string }[];
    };

    const getSegmentedImages = () => {
        const segmented = parsedResult?.segmented;
        if (!segmented) return [];
        const images: { uri: string; label: string }[] = [];
        if (segmented.body) {
            images.push({
                uri: `data:image/jpeg;base64,${segmented.body}`,
                label: "Whole Fish"
            });
        }
        if (segmented.gill) {
            images.push({
                uri: `data:image/jpeg;base64,${segmented.gill}`,
                label: "Gills"
            });
        }
        if (segmented.eye) {
            images.push({
                uri: `data:image/jpeg;base64,${segmented.eye}`,
                label: "Eyes"
            });
        }
        return images;
    };

    const images = settings.imageViewMode === 'Segmented' && parsedResult?.segmented
        ? getSegmentedImages()
        : getRawImages();

    const gradeColor = (grade: string) => {
        if (grade === 'HIGH') return '#16a34a';
        if (grade === 'MID') return '#ca8a04';
        if (grade === 'LOW') return '#dc2626';
        return '#6b7280';
    };

    const gradeBg = (grade: string) => {
        if (grade === 'HIGH') return '#dcfce7';
        if (grade === 'MID') return '#fef9c3';
        if (grade === 'LOW') return '#fee2e2';
        return '#f3f4f6';
    };

    const grade = parsedResult?.final_quality?.toUpperCase() ?? 'N/A';

    const getQualityInfo = (grade: string) => {
        if (grade === 'HIGH') return {
            message: 'Great Quality Fish!',
            advice: 'Recommended for immediate use or proper cold storage to maintain quality.'
        };
        if (grade === 'MID') return {
            message: 'Moderate Quality Fish.',
            advice: 'Consume soon and keep properly refrigerated to help maintain quality.'
        };
        if (grade === 'LOW') return {
            message: 'Fish Quality Deteriorating',
            advice: 'Careful inspection is advised before use or consumption.'
        };
        return {message: 'Quality could not be determined.', advice: 'Recapture Fish' };
        };

    const toPercent = (value: number | null | undefined) => {
        if (value == null) return 'N/A';
        return `${value.toFixed(1)}%`;
    };

    const saveResult = async (silent?: boolean) => {
    try {
        const { status } = await MediaLibrary.requestPermissionsAsync();
        if (status !== 'granted') {
            if(!silent) Alert.alert('Permission required', 'Allow access to save to gallery.');
            return;
        }
        const capturedUri = await captureRef(resultCardRef, {
            format: 'jpg',
            quality: 0.95,
        });

        await MediaLibrary.saveToLibraryAsync(capturedUri);
            if (!silent) Alert.alert('Saved!', 'Result saved to your gallery.');
        } catch (err) {
            if (!silent) Alert.alert('Error', 'Failed to save result.');
        }
    };

    useEffect(() => {
    if (!settings.saveLocally || !parsedResult || parsedResult.species === 'Unknown') return;

    const timer = setTimeout(() => {
        if (settings.saveMode === 'result') {
            saveResult(true);
        }
    }, 1000);

    return () => clearTimeout(timer);
    }, []);

    const skippedGills = !uri2 || uri2 === '' || uri2 === 'skipped';
    const skippedEyes = !uri3 || uri3 === '' || uri3 === 'skipped';

    //Error no Fish Detected
    if (!parsedResult || !parsedResult.has_fish ) {
        return (
            <SafeAreaView edges={['top']} className='flex-1 bg-primary items-center justify-center px-6'>
                <Text className='text-2xl font-bold text-[#0B1D51] text-center mb-2'>
                    No Fish Detected
                </Text>
                <Text className='text-gray-800 text-center mb-8'>
                    A fish is detected, but IsdaOK could not identify it as a supported species.
                    {'\n'}{'\n'}
                    Current Version of IsdaOK only supports Milkfish, Tilapia, and Carp
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

    //Error Out of Scope Fish
    if ( !parsedResult.species || parsedResult.species === 'Unknown') {
        return (
            <SafeAreaView edges={['top']} className='flex-1 bg-primary items-center justify-center px-6'>
                <Text className='text-2xl font-bold text-[#0B1D51] text-center mb-2'>
                    Unsupported Fish Species
                </Text>
                <Text className='text-gray-800 text-center mb-8'>
                    IsdaOK could not identify the fish in your image. Please make sure the fish is clearly visible and try again.{'\n'}{'\n'}
                    Note: Current Version of IsdaOK only handles Milkfish, Tilapia, and Carp.
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

    //Error Missing Eyes/Gills
    const missingGills = !skippedGills && !parsedResult.has_gills;
    const missingEyes = !skippedEyes && !parsedResult.has_eyes;

    if (missingGills || missingEyes) {
    const missingParts = [
        missingGills ? 'Gills' : null,
        missingEyes ? 'Eyes' : null,
    ].filter(Boolean).join(' and ');

    
    return (
            <SafeAreaView edges={['top']} className='flex-1 bg-primary items-center justify-center px-6'>
                <Text className='text-2xl font-bold text-[#0B1D51] text-center mb-2'>
                    {missingParts} Not Detected
                </Text>
                <Text className='text-gray-800 text-center mb-8'>
                    IsdaOK could not detect the {missingParts.toLowerCase()} in your image.
                    Please make sure the {missingParts.toLowerCase()} {missingGills && missingEyes ? 'are' : 'is'} clearly visible and try again.
                </Text>
                <View className='flex-row'>
                    <TouchableOpacity onPress={() => router.push('/scan/capture')}
                        style={[styles.button, { flex: 0, paddingHorizontal: 24 }]}>
                        <Text className='text-[#0B1D51] font-semibold'>Try Again</Text>
                    </TouchableOpacity>
                    <TouchableOpacity onPress={() => router.push('/home')}
                        style={[styles.button, { flex: 0, paddingHorizontal: 24, marginLeft: 8 }]}>
                        <Text className='text-[#0B1D51] font-semibold'>Go Home</Text>
                    </TouchableOpacity>
                </View>
            </SafeAreaView>
        );
    }

    const qualityInfo = getQualityInfo(grade);

    return (
        <SafeAreaView edges={['top', 'bottom']} className='flex-1 bg-primary items-center'>
            <SafeAreaView className='flex-1 bg-primary w-full max-h-0' />
            <HeaderBar onPress={() => router.back()} title='Results' />

            <ScrollView
                className='w-full'
                contentContainerStyle={{ alignItems: 'center', paddingBottom: 16 }}
                showsVerticalScrollIndicator={false}
            >

            <ViewShot ref={resultCardRef} style={{ width: '90%', paddingVertical: 5 }}>
                <View className="flex-row bg-primary" style={{ justifyContent: "center", gap: 4}}>
                    {images.map((img, i) => (
                        <View key={i} style={{
                            width: images.length === 1 ? 160 : images.length === 2 ? 160: 100,
                             marginHorizontal: 2
                            }}>
                            <Text className="text-s text-center text-black mb-1">{img.label}</Text>
                            <Image
                                source={{ uri: img.uri }}
                                style={{ width: '100%', aspectRatio: 1, borderRadius: 8 }}
                                resizeMode="cover"
                            />
                        </View>
                    ))}
                    </View>

                    <View className="bg-primary">
                        <View className="rounded-xl bg-secondary border-2 border-tertiary px-6 py-5 mt-2">

                            {/* Species + Grade Badge */}
                            <View className="flex-row justify-between items-center mb-4">
                                <Text className="text-xl font-bold text-[#0B1D51] uppercase">
                                    {parsedResult.species}
                                </Text>
                                <View style={{
                                    backgroundColor: gradeBg(grade),
                                    borderRadius: 999,
                                    paddingHorizontal: 14,
                                    paddingVertical: 4,
                                }}>
                                    <Text style={{
                                        color: gradeColor(grade),
                                        fontWeight: 'bold',
                                        fontSize: 14,
                                    }}>
                                        {grade}
                                    </Text>
                                </View>
                            </View>

                            <View className="w-full h-3 bg-gray-200 rounded-full overflow-hidden mt-2">
                                <View style={{
                                    width: `${Math.min(parsedResult?.rule_score ?? 0, 100)}%`,
                                    height: '100%',
                                    backgroundColor: gradeColor(grade),
                                    borderRadius: 999
                                }} />
                            </View>

                            <Text className='text-black'>{parsedResult?.rule_score.toFixed(1)} / 100 {'\n'}</Text> 

                            <View style={{
                                backgroundColor: gradeBg(grade),
                                borderRadius: 12,
                                padding: 12,
                                marginBottom: 16,
                            }}>
                                <Text style={{ color: gradeColor(grade), fontWeight: 'bold', fontSize: 15, marginBottom: 2 }}>
                                   {qualityInfo.message}
                                </Text>
                                <Text style={{ color: gradeColor(grade), fontSize: 12, opacity: 0.8 }}>
                                    {qualityInfo.advice}
                                </Text>
                            </View>

                            <Text className="text-xs font-semibold text-black uppercase mb-3">Detailed Scores</Text>

                            {/*Scores*/}
                            {!skippedGills && <ScoreBar label="Gills" value={parsedResult?.gill_score} />}
                            <ScoreBar label="Eyes" value={parsedResult?.eye_score} />
                            <ScoreBar label="Body" value={parsedResult?.body_score} />

                            {/* Footer */}
                            <Text className="text-gray-600 text-xs text-center mt-3">
                                {new Date().toLocaleDateString('en-PH')} • IsdaOK
                            </Text>
                        </View>
                    </View>
            </ViewShot>

            </ScrollView>

            {/* Buttons */}
                
                    <View className='flex-row items-center justify-end px-4'>
                    <TouchableOpacity onPress={() => router.push('/home')} style={styles.button}>
                        <Text>Home</Text>
                    </TouchableOpacity>
                    <TouchableOpacity onPress={() => router.push('/scan/capture')} style={styles.button}>
                        <Text>Scan Again</Text>
                    </TouchableOpacity>
                    <TouchableOpacity onPress={() => saveResult(false)} style={styles.button}>
                        <Text>Save Result</Text>
                    </TouchableOpacity>
                    </View>
               
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
    },
    toggleButton: {
        paddingHorizontal: 16,
        paddingVertical: 8,
        borderRadius: 6,
        borderWidth: 1.5,
        borderColor: '#0B1D51',
        backgroundColor: 'transparent',
    },
    toggleButtonActive: {
        backgroundColor: '#0B1D51',
    },
    toggleButtonText: {
        color: '#0B1D51',
        fontWeight: '600',
        fontSize: 14,
    },
    toggleButtonTextActive: {
        color: '#ffffff',
    }
});