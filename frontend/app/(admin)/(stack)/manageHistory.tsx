import { Text, View, ScrollView, TouchableOpacity, Image, Alert } from "react-native";
import { SafeAreaView } from "react-native-safe-area-context";
import { useEffect, useState } from "react";
import { useGlobalSearchParams } from "expo-router";
import { apiFetch } from "@/utils/api";
import trash from "@/assets/images/trash.png";

type ScanHistory = {
  id: number;
  species: string;
  rule_score: number;
  final_quality: "LOW" | "MEDIUM" | "HIGH";
  created_at: string;
};

export default function ManageHistory() {
  const {userId, username} = useGlobalSearchParams<{ userId: string; username: string }>();
  const [history, setHistory] = useState<ScanHistory[]>([]);
  const [error, setError] = useState("");
  const [success, setSuccess] = useState("");
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetchHistory();
  }, []);

  const fetchHistory = async () => {
    setLoading(true);
    setSuccess('');
	setError('');
    try {
      const res = await apiFetch(`/api/admin/users/${userId}/history`, { method: "GET" });
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

  const deleteRecord = async (id: number) => {
          Alert.alert(
              "Delete Record",
              "Are you sure you want to delete this record?",
              [{
                  text: "Delete",
                  style: "destructive",
                  onPress: async () => {
                      try {
                          const res = await apiFetch(`/api/admin/delete/record/${id}`, { method: "DELETE" });
                          const data = await res.json();
                          if (res.ok) {
                              setSuccess("Record deleted");
                              setHistory((prev) => prev.filter(s => s.id !== id));
                              setTimeout(() => setSuccess(''), 3000);
                          } else {
                              setError(data.message || "Failed to delete");
                          }
                      } catch (err) {
                          setError("Network Error. Please Try Again " + String(err));
                      }
                  },
              },  {
                    text: "Nevermind",
                    style: "cancel"
                  },
              ]
          );
      }

  return (
    <SafeAreaView edges={['top']} className="flex-1 bg-[#FFE3A9]">

        <View className="flex-row justify-center items-center">
            <Text className="text-xl font-semibold text-[#0B1D51]">{username}`&apos;`s Records</Text>
        </View>

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
              <Text className="text-gray-500 mt-2">This user hasn`&apos;`t scanned any fish.</Text>
            </View>
          ) : (
            <>
            {success && (
              <View className="flex-1 items-center justify-center px-6 py-4">
                <Text className="text-green-700 mx-4">{success}</Text>
              </View>
            )}
            {history.map((scan) => (
              <View key={scan.id} className="bg-primary rounded-xl p-4 mb-3 border border-gray-200">
                <View className="flex-row justify-between items-center">
                  <Text className="text-[#0B1D51] font-semibold text-lg">
                    {scan.species.toUpperCase() ?? "Unknown Species"}
                  </Text>
                  <Text className={`font-bold text-sm ${gradeColor(scan.final_quality)}`}>
                    {scan.final_quality}
                  </Text>
                </View>
                <View className="flex-row justify-between mt-2">
                  <Text className="text-gray-600 text-sm">
                    Overall Score: <Text className="font-semibold text-[#0B1D51]">{scan.rule_score}</Text>
                  </Text>
                  <Text className="text-gray-500 text-xs">{formatDate(scan.created_at)}</Text>
                </View>
                <View className="flex-row justify-end mt-1">
                  <TouchableOpacity
                      onPress={() => {
                          deleteRecord(scan.id);
                      }}>
                      <Image source={trash} style={{ width: 25, height: 25 }} resizeMode="contain" />
                  </TouchableOpacity>
                </View>
              </View>
            ))}
          </>
          )}
        </ScrollView>
      )}
    </SafeAreaView>
  );
}