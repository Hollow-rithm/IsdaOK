import { View, Text } from 'react-native';

export const ScoreBar = ({ label, value }: { label: string; value: number | null | undefined }) => {
    const score = value ?? 0;
    const barColor = score >= 75 ? '#16a34a' : score >= 50 ? '#ca8a04' : '#dc2626';

    return (
        <View className="mb-3">
            <View className="flex-row justify-between mb-1">
                <Text className="text-m text-gray-600">{label}</Text>
                <Text className="text-sm font-semibold text-[#0B1D51]">
                    {value != null ? value.toFixed(1) : 'N/A'}
                </Text>
            </View>
            <View className="w-full h-2 bg-gray-200 rounded-full overflow-hidden">
                <View style={{
                    width: `${Math.min(score, 100)}%`,
                    height: '100%',
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

const LOW_QUALITY_SALVAGE_THRESHOLD = 30; // below this, food use is discouraged entirely

export const getQualityInfo = (grade: string, score?: number | null) => {
    if (grade === 'HIGH') return {
        message: 'Great Quality Fish!',
        advices: [
            'Recommended for immediate use or proper cold storage to maintain quality.',
        ],
    };

    if (grade === 'MID') return {
        message: 'Moderate Quality Fish.',
        advices: [
            'Consume soon and keep properly refrigerated to help maintain quality.',
            'Cook thoroughly before eating to reduce spoilage risk.',
        ],
    };

    if (grade === 'LOW') {
        const advices = [
            'Careful inspection is advised before use or consumption.',
            'If off odor, sliminess, or discoloration is present, do not consume.',
        ];
        // Very low scores: steer away from consumption entirely
        if (score != null && score < LOW_QUALITY_SALVAGE_THRESHOLD) {
            advices.push('Quality is too low for consumption — consider repurposing as fertilizer or animal feed instead.');
        }
        return { message: 'Fish Quality Deteriorating', advices };
    }

    return {
        message: 'Quality could not be determined.',
        advices: ['Recapture Fish'],
    };
};