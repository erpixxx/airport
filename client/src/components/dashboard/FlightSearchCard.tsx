import { Button, Card, Grid, Heading, TextField } from "@radix-ui/themes";
import { ArrowRightIcon, MagnifyingGlassIcon } from "@radix-ui/react-icons";

export function FlightSearchCard() {
  return (
    <Card size="3" style={{ height: "100%" }}>
      <Heading mb="4">Znajdź połączenie</Heading>
      <Grid columns="3" gap="4">
        <TextField.Root placeholder="Miejsce odlotu">
          <TextField.Slot>
            <ArrowRightIcon />
          </TextField.Slot>
        </TextField.Root>

        <TextField.Root placeholder="Miejsce docelowe">
          <TextField.Slot>
            <ArrowRightIcon />
          </TextField.Slot>
        </TextField.Root>

        <Button size="2" variant="solid" style={{ cursor: "pointer" }}>
          <MagnifyingGlassIcon /> Szukaj lotów
        </Button>
      </Grid>
    </Card>
  );
}
