import { InfluxDB } from "@influxdata/influxdb-client";
import dotenv from 'dotenv';
dotenv.config();

const TOKEN = process.env.INFLUX_DB_TOKEN;
const URL = process.env.INFLUX_URL;
const ORG = process.env.INFLUX_URL;
const BUCKET = process.env.INFLUX_BUCKET;

const CLIENT = new InfluxDB({ url: URL, token: TOKEN });

const writeClient = CLIENT.getWriteApi(ORG, BUCKET, "ns");

const queryApi = CLIENT.getQueryApi(ORG);

export { writeClient, queryApi };
