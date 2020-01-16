class TestController < ApplicationController
    def questions

        @user = User.find(session[:user_id])
        @name = @user.fullname
        @username = @user.username

        if Score.exists?(user_id: @user.id)
            @score = Score.find(@user.id)
        else
            @score = Score.create user_id: @user.id, personality: "", scoreE: 0, scoreI: 0, scoreS: 0, scoreN: 0, scoreT: 0, scoreF: 0, scoreJ: 0, scoreP: 0
        end

        #grab variables
        @name = @user.fullname
        @gender = @user.gender
        @question_number = params['progress'].to_i
        @score_e = @score.scoreE
        @score_i = @score.scoreI
        @score_s = @score.scoreS
        @score_n = @score.scoreN
        @score_t = @score.scoreT
        @score_f = @score.scoreF
        @score_j = @score.scoreJ
        @score_p = @score.scoreP
        @personality = @score.personality

        #go to results if questions are complete
        if @question_number == 71
            #calculate personality and redirect
            if @score_e > @score_i
                @personality += "E"
            else
                @personality += "I"
            end

            if @score_s > @score_n
                @personality += "S"
            else
                @personality += "N"
            end

            if @score_t > @score_f
                @personality += "T"
            else
                @personality += "F"
            end

            if @score_j > @score_p
                @personality += "J"
            else
                @personality += "P"
            end

            # store complete user score in database (not complete)
            @score.personality = @personality
            @score.save

            # redirect to results
            redirect_to "/outcome?personality=" + @personality + "&you=" + @username
        else

            if @question_number == 1
                # reset scores to get a new one
                @score.personality = ""
                @score.scoreE = 0
                @score.scoreF = 0
                @score.scoreI = 0
                @score.scoreJ = 0
                @score.scoreN = 0
                @score.scoreP = 0
                @score.scoreS = 0
                @score.scoreT = 0
                @score.save
            end

            #get question details
            question = Question.where :number => @question_number
            @question = question[0]
        end

        
        if(params['reverse'])
            #reverse scores (have to update database)
            if params['reverse'] == 'E'
                @score_e -= 1
                @score.scoreE = @score_e
                @score.save
            elsif params['reverse'] == 'I'
                @score_i -= 1
                @score.scoreI = @score_i
                @score.save
            elsif params['reverse'] == 'S'
                @score_s -= 1
                @score.scoreS = @score_s
                @score.save
            elsif params['reverse'] == 'N'
                @score_n -= 1
                @score.scoreN = @score_n
                @score.save
            elsif params['reverse'] == 'T'
                @score_t -= 1
                @score.scoreT = @score_t
                @score.save
            elsif params['reverse'] == 'F'
                @score_f -= 1
                @score.scoreF = @score_f
                @score.save
            elsif params['reverse'] == 'J'
                @score_j -= 1
                @score.scoreJ = @score_j
                @score.save
            elsif params['reverse'] == 'P'
                @score_p -= 1
                @score.scoreP = @score_p
                @score.save
            end

        else

            #update scores (have to update database)
            if params['submission'] == 'E'
                @score_e += 1
                @score.scoreE = @score_e
                @score.save
            elsif params['submission'] == 'I'
                @score_i += 1
                @score.scoreI = @score_i
                @score.save
            elsif params['submission'] == 'S'
                @score_s += 1
                @score.scoreS = @score_s
                @score.save
            elsif params['submission'] == 'N'
                @score_n += 1
                @score.scoreN = @score_n
                @score.save
            elsif params['submission'] == 'T'
                @score_t += 1
                @score.scoreT = @score_t
                @score.save
            elsif params['submission'] == 'F'
                @score_f += 1
                @score.scoreF = @score_f
                @score.save
            elsif params['submission'] == 'J'
                @score_j += 1
                @score.scoreJ = @score_j
                @score.save
            elsif params['submission'] == 'P'
                @score_p += 1
                @score.scoreP = @score_p
                @score.save
            end

        end
    end
end