import { StatusBar } from 'expo-status-bar';
import { StyleSheet, Text, View } from 'react-native';

export default function App() {
  return (
    <View style={styles.container}>
      <Text>Agora sim</Text>
      <Text>Agora sim</Text>
      <Text>Agora sim</Text>
      <Text>Agora sim</Text>
      <Text>Agora sim</Text>
      <Text>Agora sim</Text>
      <Text>Agora sim</Text>
      <StatusBar style="auto" />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#babaca',
    alignItems: 'center',
    justifyContent: 'center',
  },
});