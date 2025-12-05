import { api } from "./common.ts";
import type { Paged } from "../types/Paged.ts";
import type { FlightItinerary } from "../types/FlightItinerary.ts";

export const getFlightsFromTo = async (
  from: string,
  to: string,
): Promise<Paged<FlightItinerary> | null> => {
  const res = await api.get(`/flights`, {
    params: {
      from: from,
      to: to,
    },
  });
  return res.data;
};

interface FlightQueryParams {
  from: string;
  page?: number;
  size?: number;
  sortBy?: string;
  direction?: "ASC" | "DESC";
}

export const getUpcomingFlights = async ({
  from,
  page = 0,
  size = 10,
  sortBy = "departure",
  direction = "ASC",
}: FlightQueryParams): Promise<Paged<FlightItinerary>> => {
  const res = await api.get(`/flights/upcoming`, {
    params: {
      from: from,
      page: page,
      size: size,
      sort: `${sortBy},${direction}`,
    },
  });
  return res.data;
};
