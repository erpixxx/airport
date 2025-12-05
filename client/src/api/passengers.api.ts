import type { PassengerSummary } from "../types/PassengerSummary.ts";
import { api } from "./common.ts";
import type { PassengerCreateRequest } from "../types/PassengerCreateRequest.ts";
import type { PassengerUpdateRequest } from "../types/PassengerUpdateRequest.ts";

export const createPassenger = async (
  request: PassengerCreateRequest,
): Promise<PassengerSummary> => {
  const res = await api.post("/passengers", request);
  return res.data;
};

export const deletePassenger = async (passengerId: string): Promise<void> => {
  await api.delete(`/passengers`, {
    params: { passengerId },
  });
};

export const getPassengers = async (
  userId: string,
): Promise<PassengerSummary[]> => {
  const res = await api.get(`/passengers`, {
    params: { userId },
  });
  return res.data;
};

export const updatePassenger = async (
  request: PassengerUpdateRequest,
): Promise<PassengerSummary> => {
  const res = await api.patch(`/passengers`, request);
  return res.data;
};
