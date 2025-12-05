import { Box, Card, Flex, Heading, Separator, Text } from "@radix-ui/themes";
import { getUpcomingFlights } from "../../api/flights.api.ts";
import { useEffect, useMemo, useState } from "react";
import type { Paged } from "../../types/Paged.ts";
import type { FlightItinerary } from "../../types/FlightItinerary.ts";

export function FlightBoardCard() {
  const [flights, setFlights] = useState<Paged<FlightItinerary>>({
    content: [],
    number: 0,
    size: 0,
    totalElements: 0,
    totalPages: 0,
  });

  useEffect(() => {
    const fetchFlights = async () => {
      const flights = await getUpcomingFlights({ from: "BZG" });
      setFlights(flights);
    };
    fetchFlights();
  }, []);

  const groupedFlights = useMemo(() => {
    const groups: Record<string, FlightItinerary[]> = {};

    flights.content.forEach((itinerary) => {
      // Pobieramy czas startu pierwszego odcinka podróży
      const departureTime = itinerary.segments[0].departureTime;
      const label = getDateLabel(departureTime);

      if (!groups[label]) {
        groups[label] = [];
      }
      groups[label].push(itinerary);
    });

    return groups;
  }, [flights.content]);

  return (
    <Card size="3" style={{ height: "100%" }}>
      <Flex justify="between" mb="4">
        <Heading>Tablica lotów</Heading>
      </Flex>

      <Flex direction="column" gap="4">
        {Object.entries(groupedFlights).map(([label, groupFlights]) => (
          <Box key={label}>
            <Flex align="center" gap="3" mb="3">
              <Separator size="4" />
              <Text size="1" color="gray" wrap="nowrap">
                {label}
              </Text>
              <Separator size="4" />
            </Flex>

            <Flex direction="column" gap="3">
              {groupFlights.map((itinerary, index) => (
                <Card key={index} variant="surface">
                  <Flex align="center" gap="3" style={{ width: "100%" }}>
                    <CityNode
                      city={itinerary.segments[0].departureAirport.city}
                      time={itinerary.segments[0].departureTime}
                      align="start"
                    />

                    {itinerary.segments.map((segment, segIndex) => (
                      <Flex
                        key={segment.id}
                        align="center"
                        gap="3"
                        flexGrow="1"
                      >
                        <Box style={{ flexGrow: 1, position: "relative" }}>
                          <Separator orientation="horizontal" size="4" />
                          <Text
                            size="1"
                            color="gray"
                            wrap="nowrap"
                            style={{
                              position: "absolute",
                              top: "-1rem",
                              left: "50%",
                              transform: "translateX(-50%)",
                            }}
                          >
                            {segment.flightNumber}
                          </Text>
                        </Box>

                        <CityNode
                          city={segment.arrivalAirport.city}
                          time={segment.arrivalTime}
                          align={
                            segIndex === itinerary.segments.length - 1
                              ? "end"
                              : "center"
                          }
                        />
                      </Flex>
                    ))}
                  </Flex>
                </Card>
              ))}
            </Flex>
          </Box>
        ))}
      </Flex>
    </Card>
  );
}

function getDateLabel(dateString: string): string {
  const date = new Date(dateString);
  const now = new Date();

  const today = new Date(now.getFullYear(), now.getMonth(), now.getDate());
  const tomorrow = new Date(today);
  tomorrow.setDate(tomorrow.getDate() + 1);

  const checkDate = new Date(
    date.getFullYear(),
    date.getMonth(),
    date.getDate(),
  );

  if (checkDate.getTime() === today.getTime()) {
    return "Dziś";
  } else if (checkDate.getTime() === tomorrow.getTime()) {
    return "Jutro";
  } else {
    return date.toLocaleDateString("pl-PL", {
      day: "numeric",
      month: "long",
      weekday: "long",
    });
  }
}

function CityNode({
  city,
  time,
  align,
}: {
  city: string;
  time: string;
  align: "start" | "center" | "end";
}) {
  return (
    <Flex direction="column" align={align}>
      <Text size="2" weight="bold">
        {city}
      </Text>
      <Text color="gray" size="1">
        {new Date(time).toLocaleTimeString([], {
          hour: "2-digit",
          minute: "2-digit",
        })}
      </Text>
    </Flex>
  );
}
