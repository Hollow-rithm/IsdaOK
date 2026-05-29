import { Text, TouchableOpacity, View, Image, Modal, Alert } from "react-native";
import logo from "@/assets/images/icon.png";
import { router } from "expo-router";
import { useAuth } from "@/utils/authContext";
import { useEffect, useState } from "react";
import AsyncStorage from "@react-native-async-storage/async-storage";

export default function Home() {
  const { logOut, username } = useAuth();
  const isGuest = username === "Guest";
  const [showWelcome, setShowWelcome] = useState(false);

  useEffect(() => {
    const checkWelcome = async () => {
      const seen = await AsyncStorage.getItem("welcome_seen");
      if (!seen) setShowWelcome(true);
    };
    checkWelcome();
  }, []);

  return (
    <View className="flex-auto items-center justify-center bg-primary px-4">

      <Modal transparent animationType="fade" visible={showWelcome}>
        <View className="flex-1 justify-center items-center bg-black/50 px-6">
          <View className="bg-white rounded-2xl px-6 py-6 w-full max-w-sm">
            <Text className="text-[#0B1D51] text-xl font-bold mb-3">
              Welcome{isGuest ? " Guest!" : `, ${username}!`}
            </Text>
            <Text className="text-gray-700 mb-2">
              In this current version, the app only supports the following fish:
            </Text>
            <Text className="text-gray-700 mb-1">{'  \u2022  Milkfish'}</Text>
            <Text className="text-gray-700 mb-1">{'  \u2022  Tilapia'}</Text>
            <Text className="text-gray-700 mb-4">{'  \u2022  Carp'}</Text>
            <Text className="text-gray-700 mb-6">
              💡 For best results, please take photos under a <Text className="font-semibold">white light</Text> for the most accurate scan.
            </Text>
            <TouchableOpacity
              className="bg-[#0B1D51] py-3 rounded-xl"
              onPress={async () => {
                await AsyncStorage.setItem("welcome_seen", "false");
                setShowWelcome(false);
              }}
            >
              <Text className="text-white text-center font-semibold">Understood!</Text>
            </TouchableOpacity>
          </View>
        </View>
      </Modal>

      <View className="items-center -mt-20">

        <Image source={logo} className="w-32 h-32 mb-22 -mt-16" resizeMode="contain"/>

        <Text className="text-[#0B1D51] text-3xl font-semibold text-center">
          Welcome{isGuest ? " Guest!" : ` ${username}!`}
        </Text>

        <TouchableOpacity className="bg-white py-2 px-4 w-40 border border-black rounded mt-4" onPress={() => router.push('/scan/capture')}>
          <Text className="text-center font-semibold text-[#0B1D51] ">Scan a Fish!</Text>
        </TouchableOpacity>

        {!isGuest && (
        <TouchableOpacity
          className="bg-white py-2 px-4 w-40 border border-black rounded mt-4"
          onPress={() => router.push('/(user)/(drawer)/history')}
        >
          <Text className="text-center font-semibold text-[#0B1D51]">History</Text>
        </TouchableOpacity>
        )}

        <TouchableOpacity
          className="bg-red-500 py-2 px-4 w-40 border border-red-700 rounded mt-4"
          onPress={() => {
            if (isGuest) {
              logOut();
            } else {
              Alert.alert(
                "Sign Out",
                "Are you sure you want to sign out?",
                [
                  { text: "Cancel", style: "cancel" },
                  { text: "Sign Out", style: "destructive", onPress: () => logOut() },
                ]
              );
            }
          }}>
          <Text className="text-center font-semibold text-white">
            {isGuest ? "Sign In" : "Sign Out"}
          </Text>
        </TouchableOpacity>

      </View>
    </View>
  );
}


