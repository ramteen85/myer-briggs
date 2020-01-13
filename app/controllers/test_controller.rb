class TestController < ApplicationController
    def questions
        #grab parameters
        @name = params['name']
        @gender = params['gender']
        @question_number = params['progress'].to_i
        @score_e = params['scoree'].to_i
        @score_i = params['scorei'].to_i
        @score_s = params['scores'].to_i
        @score_n = params['scoren'].to_i
        @score_t = params['scoret'].to_i
        @score_f = params['scoref'].to_i
        @score_j = params['scorej'].to_i
        @score_p = params['scorep'].to_i
        @personality = ""

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

            #store user in database
            # User.create name: @name, gender: @gender, personality: @personality, scoreE: @score_e, scoreI: @score_i, scoreS: @score_s, scoreN: @score_n, scoreT: @score_t, scoreF: @score_f, scoreJ: @score_j, scoreP: @score_p 

            redirect_to "/outcome?personality=" + @personality + "&name=" + @name
        else
            #get question details
            @question = Question.find(@question_number+70)
        end
    
        #update scores
        if params['submission'] == 'E'
            @score_e += 1
        elsif params['submission'] == 'I'
            @score_i += 1
        elsif params['submission'] == 'S'
            @score_s += 1
        elsif params['submission'] == 'N'
            @score_n += 1
        elsif params['submission'] == 'T'
            @score_t += 1
        elsif params['submission'] == 'F'
            @score_f += 1
        elsif params['submission'] == 'J'
            @score_j += 1
        elsif params['submission'] == 'P'
            @score_p += 1
        end
    end
end