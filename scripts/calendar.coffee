# Description
#   Displays information about the school calendar
#
# Commands:
#   hubot school calendar

calendar_2016_2017 = """


**Important Dates for St. Paul Families:**

**August 14 -** Enrollment Complete/Tuition & Fees Due
**August 16 -** First Day - Early Release at Noon
**August 20 -** Back to School Hamburger Social

**September 4 -** School Holiday - Labor Day
**September 11-15 -** Book Fair
**September 13 -** Grandparent's Day Luncheon

**October 13 -** Early Release at Noon
**October 13-14 -** State Volleyball Tny (Tomball)
**October 16-20 -** Fall Break

**November 8 -** Annual Chili Supper
**November 20-24 -** Thanksgiving Break

**December 1 -** Christmas Musical
**December 20 -** Early Release at Noon
**December 21 -** January 2 - Christmas Break

**January 5-6 -** St. Paul Basketball Tourney
**January 25-26 -** No Pre-K or MDO for Conference

**February 16-18 -** State Basketball Tny (Tomball)
**February 19 -** School Holiday - President's Day

**March 5-9 -** National Lutheran Schools Week
**March 7 -** Annual Open House and Luncheon
**March 9 -** Early Release at Noon
**March 12-16 -** Spring Break
**March 23 -** Milam County Junior Livestock Show
**March 25 -** Confirmation
**March 29 -** Early Release at Noon
**March 30 -** School Holiday - Good Friday

**April 2 -** Bad Weather Day
**April 20 -** St. Paul Field Day

**May 23 -** Pre-K 4, K, 8th Grade Graduation
**May 24 -** Last Day of School - Release at Noon

**Dates TBD:**
- District PSIA
- State PSIA
- Confirm Tourneys

**Nine-Week Quarters (167 Total Student Days):**
- First Quarter - Aug 16 - Oct 13
- Second Quarter - Oct 23 - Dec 20
- Third Quarter - Jan 3 - Mar 9
- Fourth Quarter - Mar 19 - May 24

:warning: Be sure to check [the official calendar](http://stpaulthorndale.com/wp-content/uploads/2017/05/2017-2018-SPL-School-Calendar.pdf) for the latest updates.
"""

module.exports = (robot) ->

  robot.respond /school calendar/i, (msg) ->
     msg.send "#{msg.message.user.name}, Here is the 2017-2018 School Calendar (as of 8/3/2017):" + calendar_2016_2017
