import type { AirlineSummary } from "./AirlineSummary.ts";
import type { AirportSummary } from "./AirportSummary.ts";
import type { PlaneSummary } from "./PlaneSummary.ts";

export interface FlightSegment {
  id: string;
  airline: AirlineSummary;
  arrivalAirport: AirportSummary;
  arrivalTime: string;
  departureAirport: AirportSummary;
  departureTime: string;
  flightNumber: string;
  plane: PlaneSummary;
}
