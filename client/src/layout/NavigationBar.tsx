import {
  Avatar,
  Button,
  DropdownMenu,
  Flex,
  Heading,
  Text,
} from "@radix-ui/themes";
import { ExitIcon } from "@radix-ui/react-icons";

export function NavigationBar() {
  return (
    <Flex align="center" justify="between">
      <Heading size="8" style={{ color: "var(--accent-11)" }}>
        Lotnisko
      </Heading>
      <DropdownMenu.Root>
        <DropdownMenu.Trigger>
          <Button size="3" variant="ghost" radius="full">
            <Avatar fallback={"U"} radius="full" />
            <DropdownMenu.TriggerIcon />
          </Button>
        </DropdownMenu.Trigger>
        <DropdownMenu.Content color="gray">
          <DropdownMenu.Item color="red">
            <ExitIcon />
            <Text>Logout</Text>
          </DropdownMenu.Item>
        </DropdownMenu.Content>
      </DropdownMenu.Root>
    </Flex>
  );
}
