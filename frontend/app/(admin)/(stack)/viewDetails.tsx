import { View, Text, ScrollView } from "react-native";
import { useGlobalSearchParams } from "expo-router";
import { SafeAreaView } from "react-native-safe-area-context";
import ViewShot from "react-native-view-shot";
import { useRef } from "react";

export default function viewDetails() {
    const { species, body_score, gill_score, eye_score, rule_score, ml_quality, final_quality, created_at, username } = useGlobalSearchParams<{
        scanId: string;
        species: string;
        body_score: string;
        gill_score: string;
        eye_score: string;
        rule_score: string;
        rule_quality: string;
        ml_quality: string;
        final_quality: string;
        created_at: string;
        username: string;
    }>();

    const resultCardRef = useRef<ViewShot>(null);

    const gradeColor = (grade: string) => {
        if (grade === "HIGH") return "#16a34a";
        if (grade === "MID")  return "#ca8a04";
        if (grade === "LOW")  return "#dc2626";
        return "#6b7280";
    };

    const grade = (final_quality ?? "N/A").toUpperCase();

    const getQualityInfo = (grade: string) => {
        if (grade === "HIGH")
            return {
              message: "Great Quality Fish!",
              advice: "Recommended for immediate use or proper cold storage to maintain quality.",
            };
        if (grade === "MID")
            return {
              message: "Moderate Quality Fish.",
              advice: "Consume soon and keep properly refrigerated to help maintain quality.",
            };
        if (grade === "LOW")
          return {
            message: "Fish Quality Deteriorating",
            advice: "Careful inspection is advised before use or consumption.",
          };
        return { message: "Quality could not be determined.", advice: "Recapture Fish" };
    };

    const toPercent = (value: string | null | undefined) => {
        const n = parseFloat(value ?? "");
        if (isNaN(n)) return "N/A";
        return `${n.toFixed(1)}%`;
    };

    const formatDate = (dateStr: string) => {
        if (!dateStr) return "";
        const date = new Date(dateStr);
        return date.toLocaleDateString("en-PH", {
          year:   "numeric",
          month:  "short",
          day:    "numeric",
          hour:   "2-digit",
          minute: "2-digit",
        });
    };

    const qualityInfo = getQualityInfo(grade);

    const scores = [
        { label: "Body Rating:", value: toPercent(body_score) },
        { label: "Gills Rating:", value: toPercent(gill_score) },
        { label: "Eye Rating:", value: toPercent(eye_score) },
        { label: "Overall Score:", value: toPercent(rule_score) },
        { label: "Machine Learning Quality:", value: (ml_quality ?? "N/A").toUpperCase() },
    ];

    return (
        <SafeAreaView edges={["top"]} className="flex-1 bg-secondary items-center justify-start pt-4">
            <SafeAreaView className="flex-1 bg-secondary w-full max-h-0" />
            <Text className="text-xl font-semibold text-[#0B1D51]">{username}&apos;s Fish Details</Text>
            
            <ScrollView
                className="w-full"
                contentContainerStyle={{ alignItems: "center", paddingBottom: 16 }}
                showsVerticalScrollIndicator={false}
            >
          
            <ViewShot ref={resultCardRef} style={{ width: "90%", paddingVertical: 5 }}>
                <View className="bg-secondary">
                    <View className="rounded-xl bg-primary border-2 border-tertiary px-6 py-5 mt-2">

                    {/* Species & Grade */}
                    <Text className="font-bold text-lg text-[#0B1D51] text-center uppercase mb-2">
                        {species ?? "Unknown Species"}
                    </Text>

                    {/* Main Fish Score */}
                    <View className="items-center mb-3">
                        <Text className="text-gray-500 text-sm">Fish Quality</Text>
                        <Text style={{ color: gradeColor(grade), fontWeight: "bold", fontSize: 24 }}>
                            {grade}
                        </Text>
                    </View>

                    {/* Scores */}
                    {scores.map(({ label, value }) => (
                        <View key={label} className="flex-row justify-between mb-1">
                            <Text className="text-gray-800">{label}</Text>
                            <Text className="font-semibold">{value}</Text>
                        </View>
                    ))}

                    {/* Footer */}
                    <Text className="text-gray-600 text-xs text-center mt-3">
                        {formatDate(created_at)} • IsdaOK
                    </Text>
                    </View>
                </View>
            </ViewShot>

            {/* Quality Info Card */}
            <View className="w-[90%] rounded-xl bg-primary border-2 border-tertiary px-5 py-4 mt-3">
                <Text className="text-base font-bold text-[#0B1D51] mb-1">
                    {qualityInfo.message}
                </Text>
                {qualityInfo.advice ? (
                <Text className="text-sm text-gray-500">{qualityInfo.advice}</Text>
                ) : null}
            </View>
            </ScrollView>
        </SafeAreaView>
    );
}
