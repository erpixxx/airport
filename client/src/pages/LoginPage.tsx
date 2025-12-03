import {
  Box,
  Button,
  Card,
  Flex,
  Heading,
  Text,
  TextField,
} from "@radix-ui/themes";
import { EnterIcon } from "@radix-ui/react-icons";
import { useNavigate } from "react-router-dom";

export function LoginPage() {
  const navigate = useNavigate();

  const login = () => {
    navigate("/dashboard");
  };

  return (
    <Flex height="100vh" align="center" justify="center">
      <Card>
        <Box width="360px" p="3">
          <Heading>Logowanie</Heading>
          <Flex direction="column" gap="3" my="3">
            <Box>
              <Text>Email</Text>
              <TextField.Root />
            </Box>
            <Box>
              <Text>Hasło</Text>
              <TextField.Root type="password" />
            </Box>
          </Flex>
          <Flex justify="end">
            <Button onClick={login}>
              <EnterIcon />
              <Text>Zaloguj</Text>
            </Button>
          </Flex>
        </Box>
      </Card>
    </Flex>
  );
}
