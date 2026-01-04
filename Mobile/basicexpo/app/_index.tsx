import { Redirect } from "expo-router";

// Default route sends users to the login screen
export default function _Index() {
  return <Redirect href="/login" />;
}



const instyles = {
  dummy: {
    color: "red",
  },
};

export { instyles };