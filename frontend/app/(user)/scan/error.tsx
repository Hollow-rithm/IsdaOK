import { StyleSheet, View, Text, TouchableOpacity,} from 'react-native'
import { router, useGlobalSearchParams } from 'expo-router'
import { SafeAreaView } from 'react-native-safe-area-context';

export default function Error () {
    const { result } = useGlobalSearchParams<{ result: string }>();
    let parsedResult: { status?: string } | null = null;
    try {
        parsedResult = result ? JSON.parse(result) : null;
    } catch {
        parsedResult = null;
    }

    let title: string;
    let message: string;

    switch (parsedResult?.status){
        case "NO_FISH":
            title = "No Fish Detected";
            message = "IsdaOK could not identify the fish in your image. Please make sure the fish is clearly visible and try again.\n\nNote: Current Version of IsdaOK only handles Milkfish, Tilapia, and Carp.";
            break;
        case "MULTIPLE_FISH":
            title = "Multiple Fish Detected";
            message = "IsdaOK detected multiple fish in your image. Please make sure only one fish is visible and try again.";
            break;
        case "OUT_OF_SCOPE":
            title = "Out of Scope Species";
            message = "IsdaOK detected a fish species that is not currently supported. Please make sure the fish is Milkfish, Tilapia, or Carp and try again.";
            break;
        case "PARTIAL_FISH":
            title = "Partial Fish Detected";
            message = "IsdaOK detected a fish in your image, but it is not fully visible. Please make sure the entire fish is visible and try again.";
            break;
        case "MISSING_EYE":
            title = "Eyes not Detected";
            message = "IsdaOK could not identify any fish eyes in your image. Please make sure that the fish's eye is clearly visible and try again.";
            break;
        case "WRONG_ORIENTATION":
            title = "Wrong Orientation";
            message = "IsdaOK detected a fish in your image, but it is not oriented correctly. Please make sure the fish is oriented horizontally and try again.";
            break;
        default:
            title = "Error";
            message = "An unknown error occurred. Please try again.";
            break;
    }

    return (
        <SafeAreaView edges={['top']} className='flex-1 bg-primary items-center justify-center px-6'>
            <Text className='text-2xl font-bold text-[#0B1D51] text-center mb-2'>
                {title}
            </Text>
            <Text className='text-gray-800 text-center mb-8'>
                {message}
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