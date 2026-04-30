import { createContext, useContext, useEffect, useState } from 'react';
import AsyncStorage from '@react-native-async-storage/async-storage';

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
}>({ settings: defaults, updateSetting: () => {} });

export function SettingsProvider({ children }: { children: React.ReactNode }) {
    const [settings, setSettings] = useState<Settings>(defaults);

    useEffect(() => {
        AsyncStorage.getItem('app_settings').then(stored => {
            if (stored) setSettings({ ...defaults, ...JSON.parse(stored) });
        });
    }, []);

    const updateSetting = <K extends keyof Settings>(key: K, value: Settings[K]) => {
        const updated = { ...settings, [key]: value };
        setSettings(updated);
        AsyncStorage.setItem('app_settings', JSON.stringify(updated));
    };

    return (
        <SettingsContext.Provider value={{ settings, updateSetting }}>
            {children}
        </SettingsContext.Provider>
    );
}

export const useSettings = () => useContext(SettingsContext);