trigger ForceForecasting on User (before insert) {
    for (user userinloop : Trigger.new) {
        userinloop.forecastenabled = TRUE;
    }
}