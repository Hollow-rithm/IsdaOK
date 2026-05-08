import * as Google from 'expo-auth-session/providers/google';
import * as WebBrowser from 'expo-web-browser';
import { useEffect } from 'react';

WebBrowser.maybeCompleteAuthSession();

export function useGoogleSignIn() {
  const [request, response, promptAsync] = Google.useAuthRequest({
    androidClientId: '700592935481-v85if87jhmru3rh5vgabupg5eifl9tkd.apps.googleusercontent.com',
    webClientId: "700592935481-vm6c5hjbi41r8r65nil5prp172vq8ut5.apps.googleusercontent.com",
  }, {
    
  });

  return { request, response, promptAsync };
}