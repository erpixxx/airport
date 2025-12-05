import {
  Box,
  Button,
  Card,
  Dialog,
  Flex,
  Grid,
  Heading,
  IconButton,
  Text,
  TextField,
} from "@radix-ui/themes";
import { Cross1Icon, Pencil1Icon, PlusIcon } from "@radix-ui/react-icons";
import { useEffect, useRef, useState } from "react";
import type { PassengerSummary } from "../../types/PassengerSummary.ts";
import { useUser } from "../../context/UserContext.tsx";
import {
  createPassenger,
  deletePassenger,
  getPassengers,
  updatePassenger,
} from "../../api/passengers.api.ts";

export function PassengersCard() {
  const [passengers, setPassengers] = useState<PassengerSummary[]>([]);
  const [firstName, setFirstName] = useState<string>("");
  const [lastName, setLastName] = useState<string>("");
  const [dateOfBirth, setDateOfBirth] = useState<string>("");
  const [passportNumber, setPassportNumber] = useState<string>("");
  const [editingId, setEditingId] = useState<string | null>(null);
  const [loading, setLoading] = useState<boolean>(false);
  const dialogCloseRef = useRef<HTMLButtonElement>(null);
  const { user } = useUser();

  if (!user) {
    return null;
  }

  useEffect(() => {
    loadPassengers();
  }, []);

  const loadPassengers = async () => {
    try {
      setLoading(true);
      const data = await getPassengers(user.id);
      setPassengers(data);
    } catch (error) {
      console.error("Failed to load passengers:", error);
    } finally {
      setLoading(false);
    }
  };

  const handleAddOrUpdate = async () => {
    try {
      if (editingId) {
        await updatePassenger({
          id: editingId,
          firstName,
          lastName,
          dateOfBirth,
          passportNumber,
        });
      } else {
        await createPassenger({
          userId: user.id,
          firstName,
          lastName,
          dateOfBirth,
          passportNumber,
        });
      }
      resetForm();
      loadPassengers();
      dialogCloseRef.current?.click();
    } catch (error) {
      console.error("Failed to save passenger:", error);
    }
  };

  const handleDelete = async (passengerId: string) => {
    try {
      setLoading(true);
      await deletePassenger(passengerId);
      loadPassengers();
    } catch (error) {
      console.error("Failed to delete passenger:", error);
    } finally {
      setLoading(false);
    }
  };

  const handleEdit = (passenger: PassengerSummary) => {
    setEditingId(passenger.id);
    setFirstName(passenger.firstName);
    setLastName(passenger.lastName);
    setDateOfBirth(passenger.dateOfBirth);
    setPassportNumber(passenger.passportNumber);
  };

  const resetForm = () => {
    setFirstName("");
    setLastName("");
    setDateOfBirth("");
    setPassportNumber("");
    setEditingId(null);
  };

  return (
    <Card size="3" style={{ height: "100%" }}>
      <Flex direction="column">
        <Heading>Moi pasażerowie</Heading>
        <Flex direction="column" minHeight="100px" flexGrow="1" gap="2" my="2">
          {passengers.length === 0 ? (
            <Text size="2" color="gray">
              Brak zarejestrowanych pasażerów.
            </Text>
          ) : (
            passengers.map((passenger) => (
              <Card key={passenger.id}>
                <Flex align="center" justify="between">
                  <Flex gap="8">
                    <Text>{passenger.firstName}</Text>
                    <Text>{passenger.lastName}</Text>
                    <Text>{passenger.dateOfBirth}</Text>
                    <Text>*************</Text>
                  </Flex>
                  <Flex gap="2">
                    <Dialog.Root>
                      <Dialog.Trigger>
                        <IconButton
                          color="blue"
                          size="1"
                          variant="surface"
                          onClick={() => handleEdit(passenger)}
                        >
                          <Pencil1Icon />
                        </IconButton>
                      </Dialog.Trigger>
                      <Dialog.Content>
                        <Dialog.Title>Edytuj pasażera</Dialog.Title>
                        <Dialog.Description color="gray" size="2">
                          Zaktualizuj dane pasażera poniżej.
                        </Dialog.Description>
                        <Grid columns="2" gap="4" my="4">
                          <Box>
                            <Text>Imię</Text>
                            <TextField.Root
                              value={firstName}
                              onChange={(e) => setFirstName(e.target.value)}
                            />
                          </Box>
                          <Box>
                            <Text>Data urodzenia</Text>
                            <TextField.Root
                              type="date"
                              value={dateOfBirth}
                              onChange={(e) => setDateOfBirth(e.target.value)}
                            />
                          </Box>
                          <Box>
                            <Text>Nazwisko</Text>
                            <TextField.Root
                              value={lastName}
                              onChange={(e) => setLastName(e.target.value)}
                            />
                          </Box>
                          <Box>
                            <Text>Numer paszportu</Text>
                            <TextField.Root
                              value={passportNumber}
                              onChange={(e) =>
                                setPassportNumber(e.target.value)
                              }
                            />
                          </Box>
                        </Grid>
                        <Flex justify="end" gap="4">
                          <Dialog.Close>
                            <Button color="red" onClick={resetForm}>
                              Anuluj
                            </Button>
                          </Dialog.Close>
                          <Dialog.Close>
                            <Button
                              ref={dialogCloseRef}
                              color="green"
                              onClick={handleAddOrUpdate}
                              disabled={loading}
                            >
                              Zapisz
                            </Button>
                          </Dialog.Close>
                        </Flex>
                      </Dialog.Content>
                    </Dialog.Root>
                    <IconButton
                      color="red"
                      size="1"
                      variant="surface"
                      key={passenger.id}
                      onClick={() => handleDelete(passenger.id)}
                    >
                      <Cross1Icon />
                    </IconButton>
                  </Flex>
                </Flex>
              </Card>
            ))
          )}
        </Flex>
        <Box>
          <Dialog.Root>
            <Dialog.Trigger>
              <Button onClick={resetForm}>
                <PlusIcon />
                <Text>Dodaj pasażera</Text>
              </Button>
            </Dialog.Trigger>
            <Dialog.Content>
              <Dialog.Title>
                {editingId ? "Edytuj pasażera" : "Nowy pasażer"}
              </Dialog.Title>
              <Dialog.Description color="gray" size="2">
                Wprowadź dane pasażera poniżej.
              </Dialog.Description>
              <Grid columns="2" gap="4" my="4">
                <Box>
                  <Text>Imię</Text>
                  <TextField.Root
                    value={firstName}
                    onChange={(e) => setFirstName(e.target.value)}
                  />
                </Box>
                <Box>
                  <Text>Data urodzenia</Text>
                  <TextField.Root
                    type="date"
                    value={dateOfBirth}
                    onChange={(e) => setDateOfBirth(e.target.value)}
                  />
                </Box>
                <Box>
                  <Text>Nazwisko</Text>
                  <TextField.Root
                    value={lastName}
                    onChange={(e) => setLastName(e.target.value)}
                  />
                </Box>
                <Box>
                  <Text>Numer paszportu</Text>
                  <TextField.Root
                    value={passportNumber}
                    onChange={(e) => setPassportNumber(e.target.value)}
                  />
                </Box>
              </Grid>
              <Flex justify="end" gap="4">
                <Dialog.Close>
                  <Button color="red" onClick={resetForm}>
                    Anuluj
                  </Button>
                </Dialog.Close>
                <Dialog.Close>
                  <Button
                    ref={dialogCloseRef}
                    color="green"
                    onClick={handleAddOrUpdate}
                    disabled={loading}
                  >
                    {editingId ? "Zapisz" : "Dodaj"}
                  </Button>
                </Dialog.Close>
              </Flex>
            </Dialog.Content>
          </Dialog.Root>
        </Box>
      </Flex>
    </Card>
  );
}
