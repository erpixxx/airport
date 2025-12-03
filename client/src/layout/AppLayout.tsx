import { Box, Flex } from "@radix-ui/themes";
import { NavigationBar } from "./NavigationBar.tsx";
import type { ReactNode } from "react";

export function AppLayout({ children }: { children: ReactNode }) {
  return (
    <Flex height="100vh" direction="column" gap="6" p="6">
      <NavigationBar />
      <Box flexGrow="1">{children}</Box>
    </Flex>
  );
}
