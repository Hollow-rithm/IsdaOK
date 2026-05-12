import { createContext, useContext, useEffect, useState } from 'react';
import AsyncStorage from '@react-native-async-storage/async-storage';
import * as Biometric from "@/utils/biometric";
import * as SecureStore from "expo-secure-store";
import { useAuth, getStoredToken } from '@/utils/authContext';

type PhotoQuality = '720p' | '1080p';
type SaveMode = 'none' | 'result' | 'all';

export type Settings = {
  photoQuality: PhotoQuality;
  saveLocally: boolean;
  saveMode: SaveMode;
};

const defaults: Settings = {
  photoQuality: '720p',
  saveLocally: false,
  saveMode: 'result',
}

const SettingsContext = createContext<{
    settings: Settings;
    updateSetting: <K extends keyof Settings>(key: K, value: Settings[K]) => void;
    isBiometricEnabled: boolean;
    toggleBiometric: () => Promise<void>;
}>({
    settings: defaults,
    updateSetting: () => {},
    isBiometricEnabled: false,
    toggleBiometric: async () => {}
});

export function SettingsProvider({ children }: { children: React.ReactNode }) {
    const [settings, setSettings] = useState<Settings>(defaults);
    const [isBiometricEnabled, setBiometricEnabled] = useState(false);
    const { email } = useAuth();

    useEffect(() => {
        AsyncStorage.getItem('app_settings').then(stored => {
            if (stored) setSettings({ ...defaults, ...JSON.parse(stored) });
        });

        if(!email) return;
        Biometric.isBiometricEnabled(email).then(result => {
            setBiometricEnabled(result);
        });
    }, [email]);

    const updateSetting = <K extends keyof Settings>(key: K, value: Settings[K]) => {
        const updated = { ...settings, [key]: value };
        setSettings(updated);
        AsyncStorage.setItem('app_settings', JSON.stringify(updated));
    };

    const toggleBiometric = async () => {
        if(!email) return;

        if(isBiometricEnabled){
            await Biometric.disableBiometric(email);
            setBiometricEnabled(false);
        } else {
            const token = await getStoredToken();
            if(!token) return;
            await Biometric.saveBiometric(token, email);
            await Biometric.enableBiometric(email, true);
            setBiometricEnabled(true);
        }
    };

    return (
        <SettingsContext.Provider value={{ settings, updateSetting, isBiometricEnabled, toggleBiometric }}>
            {children}
        </SettingsContext.Provider>
    );
}

export const useSettings = () => useContext(SettingsContext);