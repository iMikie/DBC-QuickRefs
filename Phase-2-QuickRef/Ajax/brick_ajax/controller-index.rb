# create a vote
post '/slogans/:id/vote/?' do
  if request.xhr?
    vote_val = Vote.vote_val_from_type(params[:vote_type])
    vote = Vote.create(vote: vote_val, slogan_id: params[:id])
    total_votes = Vote.where(slogan_id: params[:id]).count
    return {vote_count: total_votes, slogan_id: params[:id]}.to_json
  else
    return "Error - XHR request not recieved!"
    # redirect "cohorts/#{user.cohort_id}/users/#{user.id}"
  end
end
