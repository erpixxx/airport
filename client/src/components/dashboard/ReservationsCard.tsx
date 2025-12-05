import { Card, Flex, Heading, Text } from "@radix-ui/themes";

export function ReservationsCard() {
  return (
    <Card size="3" style={{ height: "100%" }}>
      <Heading>Rezerwacje</Heading>
      <Flex
        align="center"
        direction="column"
        justify="center"
        minHeight="100px"
        gap="2"
        my="2"
      >
        <Text size="2" color="gray">
          Brak nadchodzących rezerwacji.
        </Text>
      </Flex>
    </Card>
  );
}
