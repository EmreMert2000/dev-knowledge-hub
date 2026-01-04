import { useEffect, useState } from "react";
import { Text, View } from "react-native";

export default function Index() {
  const [data, setData] = useState(null);

  useEffect(() => {
    fetchData();
  }, []);

  async function fetchData() {
    // Simulate data fetching
    const result = await new Promise((resolve) => {
      setTimeout(() => {
        resolve("Data fetched");
      }, 1000);
    });

    console.log(result);
    setData(result);
  }

  return (
    <View style={styles.main}>
      <Text>Welcome to the Main Page!</Text>
      {data && <Text>{data}</Text>}
    </View>
  );
}

const styles = {
  main: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center",
  },
};
