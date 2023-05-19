class Api::V1::SnapshotsController < ApiController
  def should_retain
    return json_error_response('Some params are not present!', :unprocessable_entity) if params[:plan].blank? || params[:date].blank?

    should_retain = BackupRetentionPlan.should_retain(params[:plan], params[:date])

    render json: { should_retain: should_retain }, status: :ok
  end
end
