import { View, Text, TouchableOpacity, Alert, Dimensions, StyleSheet} from 'react-native'
import { SafeAreaView, useSafeAreaInsets } from 'react-native-safe-area-context'
import { useCameraPermissions, CameraView, CameraType } from "expo-camera";
import { useRef, useState } from 'react';
import { Ionicons } from '@expo/vector-icons';
import  BackButton  from '@/components/HeaderBar';
import { router } from 'expo-router';
import * as ImagePicker from 'expo-image-picker';
import Svg, { Defs, Mask, Rect, Circle} from 'react-native-svg';
import { useSettings } from '@/context/settingsContext';
import * as MediaLibrary from 'expo-media-library';

export default function Capture(){
    const { settings } = useSettings();
    const [imageUri, setImageUri] = useState<string | null>(null);
    const [image, setImage] = useState<string | null>(null);
    const [firstUri, setFirstUri] = useState<string | null>(null);
    const [secondUri, setSecondUri] = useState<string | null>(null);
    const [facing, setFacing] = useState<CameraType>('back');
    const [flash, setFlash] = useState<'off' | 'on' | 'auto'>('off');
    const [permission, requestPermission] = useCameraPermissions();
    const cameraRef = useRef<CameraView>(null);
    const insets = useSafeAreaInsets();
    const {width: screenWidth, height: screenHeight} = Dimensions.get('window');

    // Fish Box Dimensions
    const BOX_WIDTH = screenWidth * 0.6;
    const BOX_HEIGHT = screenHeight * 0.66;
    const BOX_X = screenWidth * 0.2;
    const BOX_Y = (screenHeight - BOX_HEIGHT) / 2;

    // Gills Dimensions
    const CIRCLE_RADIUS = 120;
    const CIRCLE_CX = screenWidth / 2;
    const CIRCLE_CY = screenHeight / 2;

    // Eyes Dimensions
    const EYE_RADIUS = 80;
    const EYE_CX = screenWidth / 2;
    const EYE_CY = screenHeight / 2;

    const step: 'body' | 'gills' | 'eyes' = !firstUri ? 'body' : !secondUri ? 'gills' : 'eyes';
    const qualityValue = settings.photoQuality === '1080p' ? 1 : 0.6;

    if (!permission){
        return (
            <View className='flex-1 items-center justify-center'>
                <Text>Requesting for camera permission...</Text>
            </View>
        );
    }

    if(!permission.granted){
        return(
            <View className='flex-1 items-center justify-center px-6'>
                <Text>Camera access is required.</Text>
                <TouchableOpacity
                    onPress={requestPermission}
                    className='rounded bg-black px-4 py-2'
                >
                    <Text className='text-white'>Grant Permission.</Text>
                </TouchableOpacity>
            </View>
        );
    }

    const captureImage = async () => {
        if (!cameraRef.current) return;

        const image = await cameraRef.current.takePictureAsync({
            quality: qualityValue,
            exif: true,
        });

        if(!firstUri){
            await saveImageIfNeeded(image.uri, true);
            setFirstUri(image.uri);
            Alert.alert('Fish Body Captured!', 'Next is Capture Gills, or Skip to Proceed', [{text: 'OK'}]);
        } else if (!secondUri) {
            await saveImageIfNeeded(image.uri, true);
            setSecondUri(image.uri);
            Alert.alert('Gills Captured!', 'Next is Capture Eyes, or Skip to Proceed', [{text: 'OK'}]);
        } else {
        // router.push({ // Second capture, proceed to result
        //     pathname: "/scan/result",
        //     params: {
        //         uri: firstUri,
        //         uri2: image.uri,
        //         metadata: JSON.stringify(image.exif)
        // });
        await saveImageIfNeeded(image.uri, true);
        await upload(firstUri, secondUri, image.uri);
    }
}

        const saveImageIfNeeded = async (uri: string, isCapture: boolean) => {
            if (!settings.saveLocally) return;
            if (settings.saveMode === 'result' && isCapture) return;
            await MediaLibrary.saveToLibraryAsync(uri);
        };

    const pickImage = async () => {
        const permissionResult = await ImagePicker.requestMediaLibraryPermissionsAsync();

        if (!permissionResult.granted){
            Alert.alert('Permission required', 'Permission to access the media library is required.');
            return;
        }

        let result = await ImagePicker.launchImageLibraryAsync({
            mediaTypes: ['images'],
            allowsEditing: true,
            aspect: [BOX_WIDTH,BOX_HEIGHT],
            quality: 0.6
        })

        console.log("Permission result: ", result)

        if (!result.canceled){
            const resultUri = result.assets[0].uri;
            await upload(resultUri);
            setImage(resultUri)

            router.push({
            pathname: "/scan/result",
            params: { uri: resultUri, metadata: JSON.stringify(result.assets[0])}
            });
        }
    }

    const upload = async (fishUri: string, gillUri?: string, eyeUri?: string) => {
        // console.log("TYPE OF URI:", typeof uri);
        // console.log("URI VALUE:", uri);
        const form_data = new FormData();

        // Required fish image
        form_data.append("fish_image", {
            uri: fishUri,
            name: "fish.jpg",
            type: "image/jpeg",
        } as any);

        // Optional gill image
        if(gillUri){
            form_data.append("gill_image", {
                uri: gillUri,
                name: "gills.jpg",
                type: "image/jpeg",
            } as any);
        }

        if(eyeUri){
            form_data.append("eye_image", {
                uri: eyeUri,
                name: "eye.jpg",
                type: "image/jpeg",
            } as any);
        }

        try {
            const response = await fetch(`${process.env.EXPO_PUBLIC_API_URL}/api/fish/analyze`,
                {
                    method: "POST",
                    body: form_data,
                });

            console.log("Fish URI: ", fishUri);
            console.log("Gills URI: ", gillUri);

            const result = await response.json();
            console.log("JSON Response: ", result);

            await saveImageIfNeeded(result.data.resultImageURI, false);

            router.push({
                pathname: "/scan/result",
                params: {
                    result: JSON.stringify(result.data),
                    uri: fishUri,
                    uri2: gillUri ?? "",
                    uri3: eyeUri ?? "",
                },
            });
        } catch (error) {
            console.error("Upload error: ", error);
            Alert.alert("Error", "Failed to process image");
        }
    }

    function toggleCameraFacing(){
        setFacing(current => (current === 'back' ? 'front' : 'back'))
    }

    function toggleFlash() {
    setFlash(current => {
        if (current === 'off') return 'on';
        if (current === 'on') return 'auto';
        return 'off';
    });
}

    const stepLabel = step === 'body'
        ? 'Capture Fish Body'
        : step === 'gills'
        ? 'Capture Gills (Recommended)'
        : 'Capture Eyes (Recommended)';

    return(
        <View className="flex-1">
            {/* Camera */}
            <CameraView ref={cameraRef} style={StyleSheet.absoluteFill} facing={facing} flash={flash}/>

            {/* Overlay */}
           {step === 'body' && (
            <View style={StyleSheet.absoluteFill} pointerEvents='none'>
                <Svg height="100%" width="100%" style={StyleSheet.absoluteFill}>
                    <Defs>
                        <Mask id="fishMask">
                            <Rect width="100%" height="100%" fill="white"/>
                            <Rect
                                x= {BOX_X}
                                y= {BOX_Y}
                                width={BOX_WIDTH}
                                height={BOX_HEIGHT}
                                rx = "12"
                                fill = "black"
                            />
                        </Mask>
                    </Defs>
                        <Rect
                        width="100%"
                        height="100%"
                        fill="rgba(0,0,0,0.55)"
                        mask="url(#fishMask)"
                        />
                </Svg>

                <View style={{
                    position: "absolute",
                    left: BOX_X,
                    top: BOX_Y,
                    width: BOX_WIDTH,
                    height: BOX_HEIGHT,
                    borderWidth: 2,
                    borderColor: "white",
                    borderRadius: 12,
                }}/>
            </View>
           )}

           {step === 'gills' && (
            <View style={StyleSheet.absoluteFill} pointerEvents='none'>
                <Svg height="100%" width="100%" style={StyleSheet.absoluteFill}>
                    <Defs>
                        <Mask id="gillsMask">
                            <Rect width="100%" height="100%" fill="white"/>
                            <Circle
                                cx = {CIRCLE_CX}
                                cy = {CIRCLE_CY}
                                r = {CIRCLE_RADIUS}
                                fill = "black"
                            />
                        </Mask>
                    </Defs>
                        <Rect
                        width="100%"
                        height="100%"
                        fill="rgba(0,0,0,0.55)"
                        mask="url(#gillsMask)"
                        />
                </Svg>

                <View style={{
                    position: "absolute",
                    left: CIRCLE_CX - CIRCLE_RADIUS,
                    top: CIRCLE_CY - CIRCLE_RADIUS,
                    width: CIRCLE_RADIUS * 2,
                    height: CIRCLE_RADIUS * 2,
                    borderWidth: 2,
                    borderColor: "white",
                    borderRadius: CIRCLE_RADIUS,
                }}>

                </View>
            </View>
           )}

           {step === 'eyes' && (
            <View style={StyleSheet.absoluteFill} pointerEvents='none'>
                <Svg height="100%" width="100%" style={StyleSheet.absoluteFill}>
                    <Defs>
                        <Mask id="eyeMask">
                            <Rect width="100%" height="100%" fill="white"/>
                            <Circle
                                cx = {EYE_CX}
                                cy = {EYE_CY}
                                r = {EYE_RADIUS}
                                fill = "black"
                            />
                        </Mask>
                    </Defs>
                        <Rect
                        width="100%"
                        height="100%"
                        fill="rgba(0,0,0,0.55)"
                        mask="url(#eyeMask)"
                        />
                </Svg>

                <View style={{
                    position: "absolute",
                    left: EYE_CX - EYE_RADIUS,
                    top: EYE_CY - EYE_RADIUS,
                    width: EYE_RADIUS * 2,
                    height: EYE_RADIUS * 2,
                    borderWidth: 2,
                    borderColor: "white",
                    borderRadius: EYE_RADIUS,
                }}>

                </View>
            </View>
           )}

           <View style={{ flex: 1, justifyContent: 'space-between' }}>
                {/* Top Bar */}
                <SafeAreaView>
                    <View className="absolute top-12 w-full items-center z-10">
                        <Text className="text-white text-lg font-bold bg-black/50 px-4 py-4 rounded-full">
                            {firstUri ? 'Capture Gills (Recommended)' : 'Capture Fish Body'}
                        </Text>

                        <TouchableOpacity onPress={toggleFlash} className='pt-2'>
                            <Ionicons
                                name={flash === 'on' ? 'flash' : flash === 'auto' ? 'flash-outline' : 'flash-off-outline'}
                                size={25}
                                color={flash === 'auto' ? 'yellow' : 'white'}
                            />
                        </TouchableOpacity>
                    </View>
                </SafeAreaView>

                {/* Bottom Area */}
                <SafeAreaView>
                    <View className="absolute w-full flex-row items-center justify-between px-8 py-6 pt-4"
                        style={{ bottom: insets.bottom }}>

                        <TouchableOpacity onPress={pickImage}>
                            <Ionicons name="images-outline" size={40} color="white" />
                        </TouchableOpacity>

                        <TouchableOpacity
                            onPress={captureImage}
                            className='h-16 w-16 rounded-full bg-white'/>

                        <TouchableOpacity onPress={toggleCameraFacing}>
                            <Ionicons name="camera-reverse-outline" size={40} color="white" />
                        </TouchableOpacity>

                    </View>
                </SafeAreaView>
            </View>

            {/* Post Body Capture */}
            {/* Retake Body button (shown on gills & eyes steps) */}
            {firstUri && (
                <TouchableOpacity
                    onPress={() => { setFirstUri(null); setSecondUri(null); }}
                    className="absolute top-28 right-4 z-10 bg-red-500 px-3 py-1 rounded-full">
                    <Text className="text-white text-sm">Retake Body</Text>
                </TouchableOpacity>
            )}

            {/* Retake Gills button (shown on eyes step only) */}
            {step === 'eyes' && (
                <TouchableOpacity
                    onPress={() => setSecondUri(null)}
                    className="absolute top-28 left-4 z-10 bg-orange-500 px-3 py-1 rounded-full">
                    <Text className="text-white text-sm">Retake Gills</Text>
                </TouchableOpacity>
            )}

            {/* Skip Gills (shown on gills step) */}
            {step === 'gills' && (
                <TouchableOpacity
                    onPress={() => {
                        // Skip gills → go to eyes step by setting a sentinel
                        setSecondUri('skipped');
                    }}
                    className="absolute bottom-40 self-center z-10 bg-black/60 px-6 py-2 rounded-full">
                    <Text className="text-white font-semibold">Skip Gills</Text>
                </TouchableOpacity>
            )}

            {/* Skip Eyes (shown on eyes step) */}
            {step === 'eyes' && (
                <TouchableOpacity
                    onPress={async () => {
                        if (firstUri) {
                            const gillUriToSend = secondUri === 'skipped' ? undefined : secondUri ?? undefined;
                            await upload(firstUri, gillUriToSend);
                        }
                    }}
                    className="absolute bottom-40 self-center z-10 bg-black/60 px-6 py-2 rounded-full">
                    <Text className="text-white font-semibold">Skip Eyes</Text>
                </TouchableOpacity>
            )}

            <BackButton onPress={() => router.push('/home')}/>

        </View>
    );
}