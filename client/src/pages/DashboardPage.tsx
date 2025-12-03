import { Box, Grid } from "@radix-ui/themes";
import { ReservationsCard } from "../components/dashboard/ReservationsCard";
import { PassengersCard } from "../components/dashboard/PassengersCard.tsx";
import { FlightBoardCard } from "../components/dashboard/FlightBoardCard.tsx";
import { FlightSearchCard } from "../components/dashboard/FlightSearchCard.tsx";

export function DashboardPage() {
  return (
    <Grid height="100%" columns="3" rows="auto 1fr" gap="6">
      <Box>
        <ReservationsCard />
      </Box>

      <Box>
        <PassengersCard />
      </Box>

      <Box style={{ gridRow: "span 2" }}>
        <FlightBoardCard />
      </Box>

      <Box style={{ gridColumn: "span 2" }}>
        <FlightSearchCard />
      </Box>
    </Grid>
  );
}
