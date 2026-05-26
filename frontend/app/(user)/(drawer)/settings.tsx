import { View, Text, Switch, TouchableOpacity, ScrollView, Alert } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { useSettings } from '@/context/settingsContext';
import { router } from 'expo-router';
import BackButton from '@/components/HeaderBar';
import * as LocalAuthentication from 'expo-local-authentication';
import { useAuth } from "@/utils/authContext";

export default function SettingsPage() {
    const { settings, updateSetting, isBiometricEnabled, toggleBiometric } = useSettings();
   const { username, role } = useAuth();
    const isGuest = role === 'guest';

    const BiometricToggle = async () => {
        if(isBiometricEnabled) {
        Alert.alert(
            "Disable Biometrics",
            "You will need to use your password to log in. Are you sure?",
            [{
                text: "Disable",
                style: "destructive",
                onPress: async () => await toggleBiometric(),
            },
                { text: "Cancel", style: "cancel" }
            ]);
        } else {
            const result = await LocalAuthentication.authenticateAsync({
                promptMessage: 'Confirm to enable biometrics',
                fallbackLabel: 'Use passcode',
                disableDeviceFallback: false,
            });
            if(result.success) await toggleBiometric();
        }
    };

    return (
        <SafeAreaView className="flex-1 bg-primary">
            <BackButton onPress={() => router.back()} />

            <ScrollView className="px-6">
                {/* Photo Quality */}
                <Text className="text-xs font-semibold text-#0B1D51 uppercase mb-2">
                    Photo Quality
                </Text>
                <View className="bg-gray-100 rounded-2xl mb-6 overflow-hidden">
                    {(['720p', '1080p'] as const).map((q, i, arr) => (
                        <TouchableOpacity
                            key={q}
                            onPress={() => updateSetting('photoQuality', q)}
                            className={`flex-row items-center justify-between px-4 py-4 ${
                                i < arr.length - 1 ? 'border-b border-gray-200' : ''
                            }`}
                        >
                            <Text className="text-base">{q}</Text>
                            {settings.photoQuality === q && (
                                <Text className="text-blue-500 font-semibold">✓</Text>
                            )}
                        </TouchableOpacity>
                    ))}
                </View>

                {/* Save Locally */}
                <Text className="text-xs font-semibold text-#0B1D51 uppercase mb-2">
                    Storage
                </Text>
                <View className="bg-gray-100 rounded-2xl mb-4 overflow-hidden">
                    <View className="flex-row items-center justify-between px-4 py-4">
                        <View className="flex-1 mr-4">
                            <Text className="text-base font-medium">Save Photos Locally</Text>
                            <Text className="text-sm text-gray-400">Save captured images to your device</Text>
                        </View>
                        <Switch
                            value={settings.saveLocally}
                            onValueChange={v => updateSetting('saveLocally', v)}
                        />
                    </View>
                </View>

                {/* Save Mode — only visible if saveLocally is on */}
                {settings.saveLocally && (
                    <View className="bg-gray-100 rounded-2xl mb-6 overflow-hidden">
                        {([
                            { value: 'result', label: 'Result Only', desc: 'Save only the scan result image' },
                            { value: 'all',    label: 'All Photos',  desc: 'Save body, gills, and eye captures too' },
                        ] as const).map(({ value, label, desc }, i, arr) => (
                            <TouchableOpacity
                                key={value}
                                onPress={() => updateSetting('saveMode', value)}
                                className={`flex-row items-center justify-between px-4 py-4 ${
                                    i < arr.length - 1 ? 'border-b border-gray-200' : ''
                                }`}
                            >
                                <View className="flex-1 mr-4">
                                    <Text className="text-base font-medium">{label}</Text>
                                    <Text className="text-sm text-gray-400">{desc}</Text>
                                </View>
                                {settings.saveMode === value && (
                                    <Text className="text-blue-500 font-semibold">✓</Text>
                                )}
                            </TouchableOpacity>
                        ))}
                    </View>
                )}

                {/* Biometric */}
                {!isGuest && (
                <>
                    <Text className="text-xs font-semibold text-[#0B1D51] uppercase mb-2">
                    Security
                    </Text>
                    <View className="bg-gray-100 rounded-2xl mb-6 overflow-hidden">
                    <View className="flex-row items-center justify-between px-4 py-4">
                        <View className="flex-1 mr-4">
                        <Text className="text-base font-medium">Biometric Login</Text>
                        <Text className="text-sm text-gray-400">Use fingerprint to log in</Text>
                        </View>
                        <Switch
                        value={isBiometricEnabled}
                        onValueChange={BiometricToggle}
                        />
                    </View>
                    </View>
                </>
                )}
            </ScrollView>
        </SafeAreaView>
    );
}
