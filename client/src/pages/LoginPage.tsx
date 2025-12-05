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
import { useUser } from "../context/UserContext.tsx";
import { authenticate } from "../api/users.api.ts";
import { useState } from "react";

export function LoginPage() {
  const [email, setEmail] = useState<string>("");
  const [password, setPassword] = useState<string>("");
  const [error, setError] = useState<string>("");
  const navigate = useNavigate();
  const { setUser } = useUser();

  const login = async () => {
    if (!email || !password) return;

    setError("");

    try {
      const res = await authenticate({ email, password });
      if (res) {
        setUser(res);
        setEmail("");
        setPassword("");
        navigate("/dashboard");
      } else {
        setError("Błąd podczas logowania");
      }
    } catch {
      setError("Hasło lub email są nieprawidłowe");
    }
  };

  return (
    <Flex height="100vh" align="center" justify="center">
      <Card>
        <Box width="360px" p="3">
          <Heading>Logowanie</Heading>
          <Flex direction="column" gap="3" my="3">
            <Box>
              <Text>Email</Text>
              <TextField.Root onChange={(e) => setEmail(e.target.value)} />
            </Box>
            <Box>
              <Text>Hasło</Text>
              <TextField.Root
                type="password"
                onChange={(e) => setPassword(e.target.value)}
              />
            </Box>
          </Flex>
          <Flex justify="between">
            <Box>{error && <Text color="red">{error}</Text>}</Box>
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
