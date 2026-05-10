import { View, Text, Image } from 'react-native';
import { ScrollView } from "react-native-gesture-handler";
import { SafeAreaView } from "react-native-safe-area-context";
import { router } from 'expo-router';
import HeaderBar from '@/components/HeaderBar';
import logo from "@/assets/images/adaptive-icon.png";
import hlogo from "@/assets/images/bg_n.png";

export default function About() {
  return (
    <SafeAreaView className="flex-1 bg-primary">
      <HeaderBar onPress={() => router.back()} title="About" />

      <ScrollView className="flex-1 px-4 pt-2">

        {/* About Section */}
        <View className="bg-secondary rounded-xl p-5 mb-4 border-2 border-tertiary">
          <Text className="text-2xl font-bold text-[#0B1D51] mb-3">
            About &quot;Isda-OK&quot;

          <Image source={logo} className="w-32 h-32" resizeMode="none"/>

          </Text>
          <Text className="text-[#0B1D51] leading-6">
            IsdaOK is a fish quality assessment application designed for low-resource
            wet market environments in the Philippines. It uses classical image processing
            and lightweight machine learning to help consumers and vendors evaluate
            fish freshness quickly and accurately.
          </Text>
        </View>

        <View className="bg-secondary rounded-xl p-5 mb-4 border-2 border-tertiary">
          <Text className="text-2xl font-bold text-[#0B1D51] mb-4">
            Meet Hollow-rithm!
            <Image source={hlogo} className="" resizeMode="none"/>
          </Text>

          <Text className="text-[#0B1D51] leading-6 pt-2">
            We are a team of passionate and hardworking students who work together to create
            innovative projects through teamwork, creativity, and dedication.
            By combining our different skills and ideas, we strive to learn,
            grow, and make a meaningful impact through our work.
          </Text>

        </View>

        {/* App Info */}
        <View className="bg-secondary rounded-xl p-5 mb-8 border-2 border-tertiary">
          <Text className="text-2xl font-bold text-[#0B1D51] mb-3">
            App Info
          </Text>
          <View className="flex-row justify-between mb-1">
            <Text className="text-gray-500">Version</Text>
            <Text className="font-semibold text-[#0B1D51]">1.0.0</Text>
          </View>
          <View className="flex-row justify-between mb-1">
            <Text className="text-gray-500">Platform</Text>
            <Text className="font-semibold text-[#0B1D51]">Android</Text>
          </View>
          <View className="flex-row justify-between mb-1">
            <Text className="text-gray-500">Contact</Text>
            <Text className="font-semibold text-[#0B1D51]">isdaok.app@gmail.com</Text>
          </View>
          <View className="flex-row justify-between">
            <Text className="text-gray-500">Website</Text>
            <Text className="font-semibold text-[#0B1D51]">isdaok.app</Text>
          </View>
        </View>

      </ScrollView>
    </SafeAreaView>
  );
}