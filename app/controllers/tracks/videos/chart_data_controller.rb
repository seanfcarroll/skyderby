module Tracks
  module Videos
    class ChartDataController < ApplicationController
      def show
        authorize track, :edit?

        fresh_when track

        @points =
          PointsQuery
          .execute(track,
                   trimmed: { seconds_before_start: 20 },
                   freq_1hz: true,
                   only: %i[fl_time altitude h_speed v_speed])
          .yield_self { |points| PointsPostprocessor.for(track.gps_type).call(points) }
      end

      def track
        @track ||= Track.find(params[:track_id])
      end
    end
  end
end
