require_relative '../spec_helper.rb'

describe "LikedJob" do 
  let(:liked_job) {LikedJob.new}

  it "has a open job id, job seeker id, and notes" do 
    liked_job = LikedJob.create(open_job_id: 1, job_seeker_id: 1 , notes: "I love this job!!" )

    expect(liked_job.open_job_id).to eq(1)
    expect(liked_job.job_seeker_id).to eq(1)
    expect(liked_job.notes).to eq("I love this job!!")

  end
end