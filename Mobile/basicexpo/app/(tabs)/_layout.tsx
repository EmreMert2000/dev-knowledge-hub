import { Stack } from "expo-router";

export const TabsLayout = () => {
  return (
    <Stack>
      <Stack.Screen 
        name="login" 
        options={{ 
          headerShown: false 
        }} 
      />
    </Stack>
  );
};

export default TabsLayout;  