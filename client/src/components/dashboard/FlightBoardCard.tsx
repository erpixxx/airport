import { Card, Flex, Grid, Heading, Separator, Text } from "@radix-ui/themes";

export function FlightBoardCard() {
  return (
    <Card size="3" style={{ height: "100%" }}>
      <Heading>Tablica lotów</Heading>
      <Flex direction="column" gap="4" my="4">
        <Flex align="center" gap="2">
          <Separator size="4" />
          <Text color="gray" size="2">
            Dziś
          </Text>
          <Separator size="4" />
        </Flex>

        <Card variant="surface">
          <Grid align="center" columns="auto 1fr auto" gap="4">
            <Flex direction="column" align="center">
              <Text weight="bold">Warszawa</Text>
              <Text color="gray" size="1">
                10:00
              </Text>
            </Flex>
            <Separator orientation="horizontal" size="4" />
            <Flex direction="column" align="center">
              <Text weight="bold">Kraków</Text>
              <Text color="gray" size="1">
                12:00
              </Text>
            </Flex>
          </Grid>
        </Card>

        <Flex align="center" gap="2" mt="2">
          <Separator size="4" />
          <Text color="gray" size="2">
            Jutro
          </Text>
          <Separator size="4" />
        </Flex>

        <Card variant="surface">
          <Grid align="center" columns="auto 1fr auto" gap="4">
            <Flex direction="column" align="center">
              <Text weight="bold">Warszawa</Text>
              <Text color="gray" size="1">
                10:00
              </Text>
            </Flex>
            <Separator orientation="horizontal" size="4" />
            <Flex direction="column" align="center">
              <Text weight="bold">Kraków</Text>
              <Text color="gray" size="1">
                12:00
              </Text>
            </Flex>
          </Grid>
        </Card>
      </Flex>
    </Card>
  );
}
