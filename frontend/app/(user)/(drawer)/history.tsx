import { Text, View, ScrollView, TouchableOpacity } from "react-native";
import { SafeAreaView } from "react-native-safe-area-context";
import { useEffect, useState } from "react";
import { router } from "expo-router";
import { apiFetch } from "@/utils/api";

type ScanHistory = {
  id: number;
  species: string;
  overall_score: number;
  quality_grade: "LOW" | "MEDIUM" | "HIGH";
  created_at: string;
};

export default function History() {
  const [history, setHistory] = useState<ScanHistory[]>([]);
  const [error, setError] = useState("");
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetchHistory();
  }, []);

  const fetchHistory = async () => {
    try {
      const res = await apiFetch("/api/fish/history", { method: "GET" });
      const data = await res.json();
      if (res.ok) {
        setHistory(data);
      } else {
        setError(data.message || "Failed to load history");
      }
    } catch (err) {
      setError("Network Error. Please Try Again.");
    } finally {
      setLoading(false);
    }
  };

  const gradeColor = (grade: string) => {
    if (grade === "HIGH") return "text-green-600";
    if (grade === "MEDIUM") return "text-yellow-600";
    return "text-red-600";
  };

  const formatDate = (dateStr: string) => {
    const date = new Date(dateStr);
    return date.toLocaleDateString("en-PH", {
      year: "numeric",
      month: "short",
      day: "numeric",
      hour: "2-digit",
      minute: "2-digit"
    });
  };

  return (
    <SafeAreaView edges={['top']} className="flex-1 bg-primary">

      {loading ? (
        <View className="flex-1 items-center justify-center">
          <Text className="text-[#0B1D51]">Loading...</Text>
        </View>
      ) : error ? (
        <View className="flex-1 items-center justify-center px-4">
          <Text className="text-red-600 text-center">{error}</Text>
          <TouchableOpacity
            className="bg-white py-2 px-4 rounded mt-4 border border-black"
            onPress={fetchHistory}
          >
            <Text className="text-[#0B1D51] font-semibold">Retry</Text>
          </TouchableOpacity>
        </View>
      ) : (
        <ScrollView className="flex-1 px-4 mt-4">
          {history.length === 0 ? (
            <View className="flex-1 items-center justify-center mt-20">
              <Text className="text-[#0B1D51] text-lg font-semibold">No scans yet!</Text>
              <Text className="text-gray-500 mt-2">Start by scanning a fish.</Text>
              <TouchableOpacity
                className="bg-white py-2 px-4 rounded mt-4 border border-black"
                onPress={() => router.push('/scan/capture')}
              >
                <Text className="text-[#0B1D51] font-semibold">Scan a Fish!</Text>
              </TouchableOpacity>
            </View>
          ) : (
            history.map((scan) => (
              <View key={scan.id} className="bg-secondary rounded-xl p-4 mb-3 border border-gray-200">
                <View className="flex-row justify-between items-center">
                  <Text className="text-[#0B1D51] font-semibold text-lg">
                    {scan.species ?? "Unknown Species"}
                  </Text>
                  <Text className={`font-bold text-sm ${gradeColor(scan.quality_grade)}`}>
                    {scan.quality_grade}
                  </Text>
                </View>
                <View className="flex-row justify-between mt-2">
                  <Text className="text-gray-500 text-sm">
                    Overall Score: <Text className="font-semibold text-[#0B1D51]">{scan.overall_score}</Text>
                  </Text>
                  <Text className="text-gray-400 text-xs">{formatDate(scan.created_at)}</Text>
                </View>
              </View>
            ))
          )}
        </ScrollView>
      )}
    </SafeAreaView>
  );
}