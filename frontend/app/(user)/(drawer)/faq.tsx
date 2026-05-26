import { View, Text } from 'react-native';
import { ScrollView } from "react-native-gesture-handler";
import { SafeAreaView } from "react-native-safe-area-context";

export default function Faq() {
  return (
    <SafeAreaView className="flex-1 bg-primary">
      <ScrollView className="flex-1 px-4 pt-2">

        {/* About Section */}
        <View className="bg-secondary rounded-xl p-5 mb-4 border-2 border-tertiary">
          <Text className="text-xl font-bold text-[#0B1D51] mb-3">
            Welcome to IsdaOK Help and FAQ!
          </Text>
          <Text className="text-[#0B1D51] leading-6">
            We’re here to help you better understand how our application works and how it assists in evaluating fish surface quality.
            If you encounter any issues, have questions about the results, or need guidance while using the app, feel free to contact
            our team through the details provided below.
          </Text>

          <Text className='mt-2'>Email Us: isdaok.app@gmail.com</Text>
        </View>

        <View className="bg-secondary rounded-xl p-5 mb-4 border-2 border-tertiary">
          <Text className="text-l font-bold text-[#0B1D51] mb-3">
            Question 1: How does IsdaOK determine fish quality?
          </Text>
          <Text className="text-[#0B1D51] leading-6">
            IsdaOK analyzes fish images using image processing and machine learning techniques to evaluate visible surface
            indicators such as the eyes, gills, and body condition.
          </Text>
        </View>

        <View className="bg-secondary rounded-xl p-5 mb-4 border-2 border-tertiary">
          <Text className="text-l font-bold text-[#0B1D51] mb-3">
            Question 2: Which type of fish images should I upload?
          </Text>
          <Text className="text-[#0B1D51] leading-6">
            IsdaOK currently analyzes only three fish species, which are Bangus (Chanos chanos), Tilapia (Oreochromis niloticus),
            and Carp (Cyprinus carpio). For accurate results, upload clear and well-lit images of the fish surface, especially the
            eyes, gills, and body. Avoid blurry or dark photos whenever possible.
          </Text>
        </View>

        <View className="bg-secondary rounded-xl p-5 mb-4 border-2 border-tertiary">
          <Text className="text-l font-bold text-[#0B1D51] mb-3">
            Question 3: What does the Fish Quality result mean?
          </Text>
          <Text className="text-[#0B1D51] leading-6">
            The result represents the estimated surface quality of the fish based on the uploaded image.
            Scores are categorized into quality levels such as High, Medium, or Low.
          </Text>
        </View>

      </ScrollView>
    </SafeAreaView>
  );
}
