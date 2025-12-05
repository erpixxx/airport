import {
  Avatar,
  Button,
  DropdownMenu,
  Flex,
  Heading,
  Text,
} from "@radix-ui/themes";
import { ExitIcon } from "@radix-ui/react-icons";
import { useNavigate } from "react-router-dom";

export function NavigationBar() {
  const navigate = useNavigate();

  const logout = () => {
    navigate("/");
  };

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
          <DropdownMenu.Item color="red" onClick={logout}>
            <ExitIcon />
            <Text>Logout</Text>
          </DropdownMenu.Item>
        </DropdownMenu.Content>
      </DropdownMenu.Root>
    </Flex>
  );
}
