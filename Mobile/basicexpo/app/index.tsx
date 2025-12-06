import { Redirect } from "expo-router";

// Default route sends users to the login screen
export default function Index() {
  return <Redirect href="/login" />;
}

