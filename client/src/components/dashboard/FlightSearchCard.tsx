import {
  Badge,
  Box,
  Button,
  Card,
  Checkbox,
  Flex,
  Grid,
  Heading,
  Text,
  TextField,
} from "@radix-ui/themes";
import { ArrowRightIcon, MagnifyingGlassIcon } from "@radix-ui/react-icons";
import { useState } from "react";
import { getFlightsFromTo } from "../../api/flights.api.ts";
import type { Paged } from "../../types/Paged.ts";
import type { FlightItinerary } from "../../types/FlightItinerary.ts";
import {
  FaChevronRight,
  FaPlaneArrival,
  FaPlaneDeparture,
} from "react-icons/fa";
import {
  toLocaleDateString,
  toLocaleTimeString,
} from "../../utils.date-format.ts";

export function FlightSearchCard() {
  const [destination, setDestination] = useState("");
  const [ignoreConnections, setIgnoreConnections] = useState(false);
  const [flights, setFlights] = useState<Paged<FlightItinerary> | null>(null);

  const handleSearch = async () => {
    const searched = await getFlightsFromTo("BZG", destination);
    setFlights(searched);
  };

  return (
    <Box height="100%" asChild>
      <Card size="3">
        <Heading mb="4">Znajdź połączenie</Heading>
        <Grid align="center" columns="4" gap="4">
          <TextField.Root
            placeholder="Miejsce docelowe"
            onChange={(e) => setDestination(e.target.value)}
          >
            <TextField.Slot>
              <ArrowRightIcon />
            </TextField.Slot>
          </TextField.Root>
          <Text as="label">
            <Flex gap="2" align="center">
              <Checkbox size="3" onCheckedChange={() => setIgnoreConnections} />
              Ignoruj loty z przesiadkami
            </Flex>
          </Text>
          <div />
          <Button size="2" variant="solid" onClick={handleSearch}>
            <MagnifyingGlassIcon /> Szukaj lotów
          </Button>
        </Grid>
        {flights && (
          <Flex direction="column" gap="2" mt="4">
            {flights.content.length === 0 ? (
              <Text>Brak dostępnych lotów.</Text>
            ) : (
              flights.content.map((itinerary, index) => (
                <Flex
                  key={index}
                  align="center"
                  gap="8"
                  justify="between"
                  p="4"
                  style={{
                    backdropFilter: "blur(10px)",
                    backgroundColor: "var(--gray-2)",
                    border: "1px solid var(--gray-5)",
                    borderRadius: "var(--radius-3)",
                  }}
                >
                  <Flex flexGrow="1" gap="3">
                    {itinerary.segments.map((segment, segIndex) => (
                      <Flex flexGrow="1" gap="2">
                        <Flex key={segIndex} direction="column" gap="1">
                          <Text size="4" weight="bold">
                            {segment.departureAirport.city}
                          </Text>
                          <Text color="gray" size="1" wrap="nowrap">
                            {segment.departureAirport.name}
                          </Text>
                          {segIndex > 0 && (
                            <Text size="2">
                              <ArrivalBadge
                                arrivalTime={
                                  itinerary.segments[segIndex - 1].arrivalTime
                                }
                              />
                            </Text>
                          )}
                          {segIndex !== itinerary.segments.length && (
                            <Text size="2">
                              <DepartureBadge
                                departureTime={segment.departureTime}
                              />
                            </Text>
                          )}
                        </Flex>
                        <Flex flexGrow="1" align="center" justify="center">
                          <FaChevronRight size="1.5em" color="var(--gray-10)" />
                        </Flex>
                        {segIndex === itinerary.segments.length - 1 && (
                          <Flex direction="column" gap="1">
                            <Text size="4" weight="bold">
                              {segment.arrivalAirport.city}
                            </Text>
                            <Text color="gray" size="1" wrap="nowrap">
                              {segment.arrivalAirport.name}
                            </Text>

                            <Text size="2">
                              <ArrivalBadge arrivalTime={segment.arrivalTime} />
                            </Text>
                          </Flex>
                        )}
                      </Flex>
                    ))}
                  </Flex>
                  <Button variant="surface">Zarezerwuj lot</Button>
                </Flex>
              ))
            )}
          </Flex>
        )}
      </Card>
    </Box>
  );
}

function ArrivalBadge({ arrivalTime }: { arrivalTime: string }) {
  return (
    <Box>
      <Badge color="indigo">
        <FaPlaneArrival />
        {toLocaleDateString(arrivalTime)} {toLocaleTimeString(arrivalTime)}
      </Badge>
    </Box>
  );
}

function DepartureBadge({ departureTime }: { departureTime: string }) {
  return (
    <Box>
      <Badge color="plum">
        <FaPlaneDeparture />
        {toLocaleDateString(departureTime)} {toLocaleTimeString(departureTime)}
      </Badge>
    </Box>
  );
}
