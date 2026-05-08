import { ScrollView } from "react-native-gesture-handler";
import { SafeAreaProvider, SafeAreaView } from "react-native-safe-area-context";

export default function About() {
  return (
    <SafeAreaProvider>
      <SafeAreaView className="flex-1 space-y-4 items-center justify-center bg-primary px-4">
        <ScrollView>


        </ScrollView>
      </SafeAreaView>
    </SafeAreaProvider>
  );
}
