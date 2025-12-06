//Login.tsx file
import { StatusBar } from 'expo-status-bar';
import { StyleSheet, Text, View } from 'react-native';
import { Link } from 'expo-router';

export default function Login() {
  return (
    <View style={styles.container}>
      <Text>Welcome to the Login Page!</Text>
      <StatusBar style="auto" />
      <Link href="/home" style={linkStyles.link}>Go to Home</Link>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
});

const linkStyles = StyleSheet.create({
  link: {
    marginTop: 20,
    fontSize: 18,
    color: 'blue',
  },
});