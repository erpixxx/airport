import {
  Box,
  Button,
  Card,
  Dialog,
  Flex,
  Grid,
  Heading,
  Text,
  TextField,
} from "@radix-ui/themes";
import { PlusIcon } from "@radix-ui/react-icons";

export function PassengersCard() {
  return (
    <Card size="3" style={{ height: "100%" }}>
      <Flex direction="column">
        <Heading>Moi pasażerowie</Heading>
        <Flex
          align="center"
          direction="column"
          justify="center"
          minHeight="100px"
          flexGrow="1"
        >
          <Text size="2" color="gray">
            Brak zarejestrowanych pasażerów.
          </Text>
        </Flex>
        <Box>
          <Dialog.Root>
            <Dialog.Trigger>
              <Button>
                <PlusIcon />
                <Text>Dodaj pasażera</Text>
              </Button>
            </Dialog.Trigger>
            <Dialog.Content>
              <Dialog.Title>Nowy pasażer</Dialog.Title>
              <Dialog.Description color="gray" size="2">
                Wprowadź dane nowego pasażera poniżej.
              </Dialog.Description>
              <Grid columns="2" gap="4" my="4">
                <Box>
                  <Text>Imię</Text>
                  <TextField.Root />
                </Box>
                <Box>
                  <Text>Data urodzenia</Text>
                  <TextField.Root type="date" />
                </Box>
                <Box>
                  <Text>Nazwisko</Text>
                  <TextField.Root />
                </Box>
                <Box>
                  <Text>Numer paszportu</Text>
                  <TextField.Root />
                </Box>
              </Grid>
              <Flex justify="end" gap="4">
                <Dialog.Close>
                  <Button color="red">Anuluj</Button>
                </Dialog.Close>
                <Dialog.Close>
                  <Button color="green">Dodaj</Button>
                </Dialog.Close>
              </Flex>
            </Dialog.Content>
          </Dialog.Root>
        </Box>
      </Flex>
    </Card>
  );
}
