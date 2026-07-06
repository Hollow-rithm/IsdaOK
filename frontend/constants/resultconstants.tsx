import { View, Text, ScrollView, Modal, TouchableOpacity } from 'react-native';
import { useSafeAreaInsets } from "react-native-safe-area-context";

type ScoringInfoModalProps = {
    visible: boolean;
    onClose: () => void;
};

export const ScoreBar = ({ label, value }: { label: string; value: number | null | undefined }) => {
    const score = value ?? 0;
    const clampedScore = Math.max(0, Math.min(score, 100));
    const barColor = clampedScore >= 72 ? '#16a34a' : clampedScore >= 60 ? '#ca8a04' : '#dc2626';

    return (
        <View className="mb-3">
            <View className="flex-row justify-between mb-1">
                <Text className="text-m text-gray-600">{label}</Text>
                <Text className="text-sm font-semibold text-[#0B1D51]">
                    {value != null ? `${value.toFixed(1)}%` : 'N/A'}
                </Text>
            </View>
            <View className="w-full h-2 bg-gray-200 rounded-full overflow-hidden">
                <View style={{
                    width: `${clampedScore}%`,
                    height: 8,
                    backgroundColor: barColor,
                    borderRadius: 999
                }} />
            </View>
        </View>
    );
};

export const gradeColor = (grade: string) => {
        if (grade === 'HIGH') return '#16a34a';
        if (grade === 'MID') return '#ca8a04';
        if (grade === 'LOW') return '#dc2626';
        return '#6b7280';
    };

export const gradeBg = (grade: string) => {
        if (grade === 'HIGH') return '#dcfce7';
        if (grade === 'MID') return '#fef9c3';
        if (grade === 'LOW') return '#fee2e2';
        return '#f3f4f6';
    };

const LOW_QUALITY_SALVAGE_THRESHOLD = 20; // below this, food use is discouraged entirely

export const getQualityInfo = (grade: string, score?: number | null) => {
    const normalizedGrade = grade?.toUpperCase();

    if (normalizedGrade === 'HIGH') return {
        message: 'Great Surface Quality!',
        advices: [
            'Recommended for immediate use or proper cold storage to maintain quality.',
        ],
    };

    if (normalizedGrade === 'MID') return {
        message: 'Moderate Surface Quality.',
        advices: [
            'Consume soon and keep properly refrigerated to help maintain quality.',
            'Cook thoroughly before eating to reduce spoilage risk.',
        ],
    };

    if (normalizedGrade === 'LOW') {
        const advices = [
            'Careful inspection is advised before use or consumption.',
            'If off odor, sliminess, or discoloration is present, do not consume.',
        ];
        // Very low scores: steer away from consumption entirely
        if (score != null && score < LOW_QUALITY_SALVAGE_THRESHOLD) {
            advices.push('Consider repurposing as fertilizer or animal feed instead.');
        }
        return { message: 'Surface Quality Deteriorating', advices };
    }

    return {
        message: 'Quality could not be determined.',
        advices: ['Recapture Fish'],
    };
};

export const ScoringInfoModal = ({ visible, onClose }: ScoringInfoModalProps) => {
    const insets = useSafeAreaInsets();

    return (
        <Modal
            visible={visible}
            animationType="slide"
            transparent={true}
            onRequestClose={onClose}
        >
            <View style={{
                flex: 1,
                backgroundColor: 'rgba(0,0,0,0.5)',
                justifyContent: 'flex-end',
            }}>
                <View style={{
                    backgroundColor: 'white',
                    borderTopLeftRadius: 20,
                    borderTopRightRadius: 20,
                    paddingTop: 20,
                    paddingHorizontal: 20,
                    paddingBottom: insets.bottom + 16,
                    maxHeight: '80%',
                }}>
                    <View style={{ flexDirection: 'row', justifyContent: 'space-between', alignItems: 'center', marginBottom: 12 }}>
                        <Text style={{ fontSize: 17, fontWeight: 'bold', color: '#0B1D51' }}>
                            How Our Metrics Work
                        </Text>
                        <TouchableOpacity onPress={onClose}>
                            <Text style={{ fontSize: 20, color: '#6b7280' }}>✕</Text>
                        </TouchableOpacity>
                    </View>

                    <ScrollView>
                        <Text style={{ fontSize: 13, color: '#374151', marginBottom: 12 }}>
                            Each fish is scored using three visual indicators, combined into an overall surface quality score.{'\n\n'}
                            Each indicator is ranked according to IsdaOK metrics supported by the Fisheries Experts in BFAR and existing studies.
                        </Text>

                        <Text style={{ fontSize: 14, fontWeight: '600', color: '#0B1D51', marginBottom: 4 }}>① Gills</Text>
                        <Text style={{ fontSize: 12, color: '#6b7280', marginBottom: 10 }}>
                            The Gills is weighted at 50% as it contributes mostly on the quality of the fish.
                            Bright red or pink gills score higher. Brown, grey, or white gills lower the score.
                        </Text>

                        <Text style={{ fontSize: 14, fontWeight: '600', color: '#0B1D51', marginBottom: 4 }}>② Eyes</Text>
                        <Text style={{ fontSize: 12, color: '#6b7280', marginBottom: 10 }}>
                            The Eyes is weighted at 30%.
                            Clear eyes score higher. Cloudy, bloody, or discolored eyes indicate age.
                        </Text>

                        <Text style={{ fontSize: 14, fontWeight: '600', color: '#0B1D51', marginBottom: 4 }}>③ Body</Text>
                        <Text style={{ fontSize: 12, color: '#6b7280', marginBottom: 10 }}>
                            The Body is weighted at 20% as it offers only a miniscule information about the fish quality.
                            Shiny scales, undamaged skin scores higher. Slimy, discoloration, damaged skin lowers the score.
                        </Text>

                        <Text style={{ fontSize: 14, fontWeight: '600', color: '#0B1D51', marginBottom: 4 }}>Machine Learning Quality</Text>
                        <Text style={{ fontSize: 12, color: '#6b7280', marginBottom: 10 }}>
                            The Machine Learning Quality independently evaluates the same photo and give its own quality assessment.
                            This acts as a second opinion, when both agree, you can be more confident with the given result.
                        </Text>

                        <Text style={{ fontSize: 14, fontWeight: '600', color: '#0B1D51', marginBottom: 4 }}>Overall Score & Grade</Text>
                        <Text style={{ fontSize: 12, color: '#6b7280', marginBottom: 10 }}>
                            The three scores are calculated into one overall score, then grouped into HIGH, MID, or LOW quality. {'\n'}
                            The general score breakdown follows this format: {'\n'}
                            Overall Score = (Gills x 50%) + (Eyes x 30) + (Body x 20%)
                        </Text>

                    </ScrollView>
                </View>
            </View>
        </Modal>
    );
};