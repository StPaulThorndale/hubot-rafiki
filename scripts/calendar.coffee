# Description
#   Displays information about the school calendar
#
# Commands:
#   hubot school calendar

calendar_2016_2017 = """


**Important Dates for St. Paul Families:**

**August 1 -** Enrollment Complete/Tuition and Fees Due
**August 17 -** First Day - Early Release at Noon

**September 5 -** School Holiday - Labor Day

**October 14 -** Early Release at Noon
**October 17-21 -** Fall Break

**November 9 -** Annual Chili Supper
**November 21-25 -** Thanksgiving Break

**December 2 -** Christmas Musical
**December 16 -** Early Release at Noon
**December 19 -** January 2 - Christmas Break

**January 6-7 -** St. Paul Basketball Tourney
**January 26-27 -** No Pre-K or MDO for Conference

**February 20 -** School Holiday - President's Day

**March 6-10 -** National Lutheran Schools Week
**March 10 -** Early Release at Noon
**March 13-17 -** Spring Break

**April 13 -** Bad Weather Day
**April 14 -** School Holiday - Good Friday
**April 17 -** Bad Weather Day
**April 21 -** St. Paul Field Day

**May 6 -** PSIA State Meet
**May 18 -** Pre-K 4, K, 8th Grade Graduation
**May 19 -** Last Day of School - Release at Noon

**Dates TBD:**
- State Volleyball Tournament (OCT)
- State Basketball Tournament (FEB)
- PSIA District Meet (FEB)
- PTF Monthly Meetings

**Nine-Week Quarters (167 Total Student Days):**
- First Quarter - Aug 17 - Oct 14
- Second Quarter - Oct 24 - Dec 16
- Third Quarter - Jan 3 - Mar 10
- Fourth Quarter - Mar 20 - May 19
"""

module.exports = (robot) ->

  robot.respond /school calendar/i, (msg) ->
     msg.send "#{msg.message.user.name}, Here is the 2016-2017 School Calendar (as of 3/29/2016):" + calendar_2016_2017
