import * as SecureStore from "expo-secure-store";

const BIOMETRIC_TOKEN_KEY = (email: string) => {
    const emailKey = email.replace(/[^a-zA-Z0-9]/g, "-");
    return `biometric-auth-key-${emailKey}`;
};
const BIOMETRIC_EMAIL_KEY = "biometric-email";
const BIOMETRIC_EMAIL_ACTIVE = "biometric-email-active";
const BIOMETRIC_ENABLED = (email: string) => {
    const emailKey = email.replace(/[^a-zA-Z0-9]/g, "-");
    return `enabled-biometrics-for-${emailKey}`;
};

export const enableBiometric = async (email: string, enabled: boolean) => {
    await SecureStore.setItemAsync(BIOMETRIC_ENABLED(email), String(enabled));
};

export const disableBiometric = async (email?: string) => {
    const target = email ?? await SecureStore.getItemAsync(BIOMETRIC_EMAIL_KEY);
    if(target){
        await SecureStore.deleteItemAsync(BIOMETRIC_ENABLED(target));
        await enableBiometric(target, false);
    }
    await SecureStore.deleteItemAsync(BIOMETRIC_EMAIL_KEY);
    await SecureStore.deleteItemAsync(BIOMETRIC_EMAIL_ACTIVE);
};

export const isBiometricEnabled = async (email: string): Promise<boolean> => {
    const enabled = await SecureStore.getItemAsync(BIOMETRIC_ENABLED(email));
    return enabled === "true";
};

export const saveBiometric = async (token: string, email: string) => {
    await SecureStore.setItemAsync(BIOMETRIC_TOKEN_KEY(email), token);
    await SecureStore.setItemAsync(BIOMETRIC_EMAIL_KEY, email);
    await SecureStore.setItemAsync(BIOMETRIC_EMAIL_ACTIVE, email);
};

export const getBiometricToken = async (): Promise<string | null> => {
    const email = await SecureStore.getItemAsync(BIOMETRIC_EMAIL_ACTIVE);
    if(!email) return null;
    return await SecureStore.getItemAsync(BIOMETRIC_TOKEN_KEY(email));
};

export const getBiometricActiveEmail = async (): Promise<string | null> => {
    return await SecureStore.getItemAsync(BIOMETRIC_EMAIL_ACTIVE);
};

export const hasBiometric = async (email?: string): Promise<boolean> => {
    const target = email ?? await SecureStore.getItemAsync(BIOMETRIC_EMAIL_KEY);
    if(!target) return false;
    const token = await SecureStore.getItemAsync(BIOMETRIC_TOKEN_KEY(target));
    return !!token;
};

export const deleteBiometric = async (email?: string) => {
    const target = email ?? await SecureStore.getItemAsync(BIOMETRIC_EMAIL_KEY);
    if(target) await SecureStore.deleteItemAsync(BIOMETRIC_TOKEN_KEY(target));
    await SecureStore.deleteItemAsync(BIOMETRIC_EMAIL_KEY);
};

export const refreshBiometricToken = async (token: string) => {
    const email = await SecureStore.getItemAsync(BIOMETRIC_EMAIL_KEY);
    if(!email) return;
    await SecureStore.setItemAsync(BIOMETRIC_TOKEN_KEY(email), token);
};