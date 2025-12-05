import type { FlightSegment } from "./FlightSegment.ts";

export interface FlightItinerary {
  segments: FlightSegment[];
  stops: number;
}
