/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.util;

import com.google.gson.JsonDeserializationContext;
import com.google.gson.JsonDeserializer;
import com.google.gson.JsonElement;
import com.google.gson.JsonParseException;
import java.lang.reflect.Type;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Locale;

/**
 *
 * @author NERIO
 */
public class TimeDeserializer implements JsonDeserializer<Time> {

    private static final String TIME_FORMAT = "HH:mm:ss a";

    @Override
    public Time deserialize(JsonElement jsonElement, Type typeOF,
            JsonDeserializationContext context) throws JsonParseException {
        try {

            String s = jsonElement.getAsString();
            SimpleDateFormat sdf = new SimpleDateFormat(TIME_FORMAT, Locale.US);
            sdf.parse(s);
            long ms = sdf.parse(s).getTime();
            Time t = new Time(ms);
            return t;
        } catch (ParseException e) {
        }
        throw new JsonParseException("Unparseable time: \"" + jsonElement.getAsString()
                + "\". Supported formats: " + TIME_FORMAT);
    }
}
//private static final String DATE_FORMAT = "yyyy-MM-dd'T'HH:mm:ss";


/*private class DateDeserializer implements JsonDeserializer<Date> {

 @Override
 public Date deserialize(JsonElement jsonElement, Type typeOF,
 JsonDeserializationContext context) throws JsonParseException {
 try {
 return new SimpleDateFormat(DATE_FORMAT, Locale.US).parse(jsonElement.getAsString());
 } catch (ParseException e) {
 }

 throw new JsonParseException("Unparseable date: \"" + jsonElement.getAsString()
 + "\". Supported formats: " + DATE_FORMAT);
 }
 }*/
