-- -------------------------------------------------------------
-- TablePlus 5.6.1(515)
--
-- https://tableplus.com/
--
-- Database: govuk_rails_boilerplate_development
-- Generation Time: 2023-11-07 11:25:12.6330
-- -------------------------------------------------------------


DROP TABLE IF EXISTS "public"."content_pages";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS content_pages_id_seq;

-- Table Definition
CREATE TABLE "public"."content_pages" (
    "id" int8 NOT NULL DEFAULT nextval('content_pages_id_seq'::regclass),
    "title" varchar,
    "slug" varchar,
    "markdown" varchar,
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL,
    "parent_id" int4,
    "position" int4,
    "next_id" int4,
    "previous_id" int4,
    "is_published" bool DEFAULT false,
    "author" varchar,
    "description" varchar,
    "content_list" varchar,
    "intro" varchar,
    PRIMARY KEY ("id")
);

INSERT INTO "public"."content_pages" ("id", "title", "slug", "markdown", "created_at", "updated_at", "parent_id", "position", "next_id", "previous_id", "is_published", "author", "description", "content_list", "intro") VALUES
(1, 'Communication and language', 'communication-and-language', '
Access resources, activity ideas and advice for teaching communication and language to early years children. 

## Communication and language resources

Resources are split into 3 areas based on the educational programmes: 

[Interactions](/communication-and-language/interactions)


[Exploring language](/communication-and-language/exploring-language)

[Listening and understanding](/communication-and-language/listening-and-understanding)

These resources will help you when reviewing your current curriculum to make sure you are meeting the requirement of the revised communication and language area of learning.  

As you make changes to your curriculum consider what you want children to learn first and plan opportunities for them to achieve this.

Please bear in mind any current covid restrictions and/or advice when undertaking any suggested activities.

## What the early years foundation stage (EYFS) framework says about communication and language

The development of children''s spoken language underpins all seven areas of learning and development.

<details class="govuk-details" data-module="govuk-details">
<summary class="govuk-details__summary">
<span class="govuk-details__summary-text">
Read more
</span>
</summary>
<div class="govuk-details__text">
<p>Children''s back-and-forth interactions from an early age form the foundations for language and cognitive development.</p>

<p>The number and quality of the conversations they have with adults and peers throughout the day in a language-rich environment is crucial.</p>

<p>By commenting on what children are interested in or doing, and echoing back what they say with new vocabulary added, practitioners will build children''s language effectively.</p>

<p>Reading frequently to children, and engaging them actively in stories, non-fiction, rhymes and poems, and then providing them with extensive opportunities to use and embed new words in a range of contexts, will give children the opportunity to thrive.</p>

<p>Through conversation, story-telling and role play, where children share their ideas with support and modelling from their teacher, and sensitive questioning that invites them to elaborate, children become comfortable using a rich range of vocabulary and language structures.</p> 
</div>
</details>

$CTA

**Get alerts for new EYFS resources**

[Sign up to get emails when we add new early years foundation stage resources to this website](https://docs.google.com/forms/d/e/1FAIpQLSdZbPz-447CADTErT9eD1IU4yKfsEhyJy1C8U1fyFAQuEtejw/viewform?usp=sf_link)

$CTA', '2021-02-23 17:48:29.196456', '2022-02-07 14:20:39.347498', NULL, 1, 3, 45, 't', 'Helen Rapp', '', '', ''),
(2, 'Exploring language', 'exploring-language', '##Why exploring language is important

Children’s speech develops from babble, to words, to simple sentences through hundreds of hours of interactions with adults. Studies show that once babies begin to understand words their vocabulary increases quickly:

- by age 1, children recognise about 50 words
- by age 3, children recognise about 1,000 words
- by age 5, children recognise about 10,000 words

Having a large vocabulary helps children learn more. Words allow them to make sense of the world around them.

Communication and language is a EYFS prime area which means that it''s one of the important building blocks for all the other areas. If it''s not developed early it''s difficult to achieve later.

Children''s language skills are connected to their overall development and can predict their educational success. As speaking and listening develops, children build foundations for literacy, for making sense of visual and verbal signs and ultimately for reading and writing.

Children from more disadvantaged backgrounds may have fewer chances to develop their vocabulary. However, research shows that lots can be done in the early years to avoid inequalities in children’s language development.

Removing this inequality should be a priority for you. You can work towards this by providing a language rich environment full of stories, rhymes, songs and play with words that are of interest to children. Children can make good progress with early language development with the right support.

There are also lots of benefits from learning more than one language (including sign language) for example, understanding of grammar, spelling, creativity and story-telling skills.

##Video

In this video, an early years expert explains the importance of exploring language in the early years foundation stage framework. There are also some tips on how to support children in this area.


$YoutubeVideo[OPTIONAL TITLE](https://www.youtube.com/watch?v=ZvMeKnJWQz4&list=PL7914115EB65911A5&index=1)$EndYoutubeVideo


##What the EYFS framework says

Through conversation, story-telling and role play, where children share their ideas with support and modelling from their teacher, and sensitive questioning that invites them to elaborate, children become comfortable using a rich range of vocabulary and language structures.

[Statutory framework for the early years foundation stage](https://www.gov.uk/government/publications/early-years-foundation-stage-framework--2 ), page 8.

##What this means in practice

Children develop strong language skills when they are involved in playful, language-rich environments with opportunities to learn new words. Hands-on experiences encourage learning and provide a context for new words to be explored. For example, it’s easier for children to learn vegetable names when they are touching or tasting them.

Songs and rhymes offer fun ways to explore the sounds and patterns of words. Poems with actions and repetition help children listen to the structure of spoken language and explore new words.

Reading stories aloud and sharing books supports children to develop language and understand new concepts. Encouraging children to notice pictures and understand words, will strengthen their language skills and widen their vocabulary.

Non-fiction and high-quality texts such as story books, encourage children to make sense of the world around them using language. Encouraging talk when sharing books is an excellent way to support communication and language.

Children extend language with pretend play and acting out stories. By offering props and ideas you can deepen the learning. This may include imaginative play with small world resources such as dolls houses, farms or garages, open ended materials (those which can be used in more than one way) such as blocks or loose parts. You can encourage language development through creativity and problem solving during activities like:

- painting
- exploring
- observing nature
- music

##Suggested activities

###Story scribing

![Three laminated picture books](https://help-for-early-years-providers.education.gov.uk/rails/active_storage/blobs/proxy/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBdklCIiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--10dd1ec93c85b4df27076eb4eb2405696ec66b97/commsandlang-exploringlang-storyscribing.jpg "Three laminated picture books")

Children are born communicators and often practice their developing language skills by engaging in story-telling, through role play, small world and made-up games. 

You can encourage and support this exploration of early language by scaffolding children’s learning and writing down exactly what children say, in the form of story books, for them to enjoy over and over again. Young children love repetition and this type of activity will offer important opportunities for them to feel their voice has been heard.

For younger children story scribing may involve creating picture books of recent experiences, such as trips to the park or birthday parties, with key people and phrases included. These can be created using pre-made photo albums or simply by stringing together printed photographs. Often these can be contributed to by parents or carers and allow practitioners to gain a deeper understanding of a child’s home learning environment, including key vocabulary.

For older children, you can transcribe more elaborate and creative experiences such as children’s own interpretations of familiar stories, superhero play adventures or the ‘rules’ of a game the children have invented. Again, these can be made into a paper story book or displayed as storyboards for children to return to and follow. 

Often children enjoy re-enacting these stories with practitioners and their peers, so a simple marked out ‘performance area’ or cardboard box ‘theatre’ may support children to share and enjoy these ‘stories’ further.

###How the activity links to the other areas of learning

This activity links to children’s [personal, social and emotional development](/personal-social-and-emotional-development) and [literacy](/literacy), as they share stories and interact with others. It also provides opportunities for children to engage in [expressive arts and design](/expressive-arts-and-design).

##Sensitively narrating children’s play

Children learn language when it is introduced to them sensitively, at a time it is relevant to them, in manageable amounts, and with plenty of time to process. One way of encouraging children’s understanding, and later use, of verbal language is to offer examples to them as they play. Narrating children’s play in these ways: 
  
Commenting, or describing what children are doing, as they are doing it. Using simple, repetitive phrases and pausing in between. This is particularly helpful for complex concepts, for example things you cannot hold, like ‘red’, ‘bigger’ or ‘tomorrow’ and should never feel like you are overwhelming the child with words without meaning.   

For example, during block play: “your tower is getting taller and taller”.
  
Expanding on what children say as you reply, adding one or 2 words. This shows children you are interested and supports them to begin linking words and ideas in play. It can also be helpful to remember that, if you ask a child one question and they are unable to reply, you may demonstrate responding by offering 4 comments.

For example, ‘what have you got?’ (question) Pause ‘It’s a car’, ‘It’s a red car’, ‘It’s a red, fast car’, ‘It goes vrroomm!’ (comments). 
  
Recasting, or modelling, back what the child says, in the right form, but without openly correcting them. For example, in the role play area, if a child said ‘the baby sleeped in the bed’ you might say ‘oh, shhh, the baby’s sleeping in the bed’ to support the understanding of the complex relationships between grammar and vocabulary. 
  
Pausing, allowing children extra time to respond, before speaking again. This supports language use as children’s brains develop and fine-tune those important connections which enable them to receive and understand messages, before forming and expressing their response.

For example, when talking to a child about their play, say something but then wait several seconds (count to 7 in your head) and keep looking at them so that they know you are interested and listening for their response. 

Be flexible and responsive to different learning situations and interact in an authentic way having been invited into a child''s play. This will help to make sure that thinking is not interrupted and there is a sense of equality between you and the child.


##Other activities

This clip shows [a practitioner tuning in to a young child singing](https://www.sirenfilms.co.uk/library/evan-sings-action-song/) and joining in with the words, following his lead to acknowledge his interests and being a playful communication partner.

##What other nurseries and childminders are doing

^”Central to our practice is establishing a shared context to start the conversational journey. Planning learning experiences through the ‘lens of accessibility'' with lots of ways for English as an additional language children to attend, participate and communicate without needing words. Visual signs, simple language and familiar routines all help. Children develop the motivation of being valued members of the group and can share their knowledge and interests with us, even if we do not share their language. Familiar objects to model telling a story create a point of shared understanding and new vocabulary can be introduced. Natural, playful repetition found in all good story telling supports learners to thrive”.^

Jet, St Pauls Nursery School and Children’s Centre, Bristol

##Summary

- Language development in the first years of life is important to later educational success.
- Communication and language is a prime area in the EYFS and is difficult for children to develop later on.
- Language development is best supported in a playful language environment full of stories, songs, rhymes, signs, talk and imaginative play.
- You are important in narrowing the word gap and supporting all children to make good progress.
- You can be a skilled communication partner with children to support their language development.

##Next steps

- Consider how having an understanding of typical communication and language development stages could further improve your practice.
- Review how you meet all children’s communication needs, including non-verbal learners.
- Strengthen partnerships with parents and carers, and professionals to support children’s speech, language and communication.
- Review your curriculum to ensure you cover the requirements in the EYFS for this area of learning.

$CTA

**Get alerts for new EYFS resources**

[Sign up to get emails when we add new early years foundation stage resources to this website](https://docs.google.com/forms/d/e/1FAIpQLSdZbPz-447CADTErT9eD1IU4yKfsEhyJy1C8U1fyFAQuEtejw/viewform?usp=sf_link)

$CTA

', '2021-02-23 17:48:29.206466', '2022-09-06 13:25:18.358811', 1, 2, 4, 3, 't', 'Helen Rapp', 'Learn more about exploring language as part of the early years foundation stage (EYFS) including advice from experts and suggested activities.', '{:.contents-list__list}
* {:.contents-list__list-item .contents-list__list-item--dashed} [Why exploring language is important](#why-exploring-language-is-important)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Video](#video)
* {:.contents-list__list-item .contents-list__list-item--dashed}[What the EYFS framework says](#what-the-eyfs-framework-says)
* {:.contents-list__list-item .contents-list__list-item--dashed}[What this means in practice](#what-this-means-in-practice)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Suggested activities](#suggested-activities)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Other activities](#other-activities)
* {:.contents-list__list-item .contents-list__list-item--dashed} [What other nurseries and childminders are doing](#what-other-nurseries-and-childminders-are-doing)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Summary](#summary) 
* {:.contents-list__list-item .contents-list__list-item--dashed} [Next steps](#next-steps)   ', 'Learn more about exploring language as part of the early years foundation stage (EYFS), including advice from experts and suggested activities.'),
(3, 'Interactions', 'interactions', '##Why interactions are important

From birth, babies want to connect with others and are eager to interact. For example, they might kick their legs ready to play a peekaboo game. These are important parts of an interaction that adults should notice and encourage.

Being with others helps children to build social relationships which provide opportunities for friendship, empathy and sharing emotions.

Research shows that good interactions between adults and children make a big difference to how well communication and language skills develop. Children benefit from being with responsive and enthusiastic adults who show interest in talking with them.

##Video

In this video, an early years expert explains the importance of interactions in the early years foundation stage framework. There are also some tips on how to support children in this area.


$YoutubeVideo[OPTIONAL TITLE](https://www.youtube.com/watch?v=QHXipia3u-0&list=PL7914115EB65911A5&index=5)$EndYoutubeVideo

##What the EYFS framework says

Children’s back-and-forth interactions from an early age form the foundations for language and mental development.

The number and quality of the conversations they have with adults and other children throughout the day in a language-rich environment is crucial.

By commenting on what children are doing or interested in and echoing back what they say with new vocabulary added, you will build children''s language effectively.

[Statutory framework for the early years foundation stage](https://www.gov.uk/government/publications/early-years-foundation-stage-framework--2).


##What this means in practice

The setting, relationships and the role of the adults are important in maintaining good interactions with children.

Good interactions use:

- words
- body language
- facial expressions
- actions
- songs

To support children who are non-verbal use objects, pictures, or visual cues, such as showing a coat to indicate going outside.

Taking turns and waiting for a child to respond builds confidence and independence. Maintain a conversation by being warm and attentive and adapting your language to meet the needs of individual children.

If you join in with children’s play and comment, repeat back, wonder aloud and add new words you will extend their language.

You should plan the curriculum to allow for these good interactions and share ideas with parents to support the children at home.

##Suggested activities

###Blowing bubbles  

You’ll need:

- a bubble wand and bubble mixture 
- an uncluttered, quiet, familiar place to play on the floor where both child and adult can see each other well 
- uninterrupted time so that the interactions can be unrushed and the adult has time to notice and tune in to the child 

Simple games like blowing bubbles can help babies and non-verbal children to learn to take turns and communicate. 

Capture the child’s attention and interest by blowing the bubbles and watching them pop. 

Build anticipation by saying “ready, steady……” but do not blow the bubbles yet.  Smile and wait for the child to gesture (reach out) before blowing the bubbles again as you say “Go.” 

Respond to their reaction and notice what they do. Use words to accompany their reaction, such as “yay, bubbles.” 

Repeat when the child reaches out again “ah, you want more bubbles?” Wait until they are ready to play again, they might show you with facial expressions, giggles, gestures, eye contact and movement. 

This fun game is a great way to engage very young learners who are pre-verbal or older learners who may have communication difficulties. It teaches about the back and forth of communication and interaction to support the idea of a conversation. 

###Communication boxes

Encourage children to bring in boxes filled with things from home to share and to talk about with you. You can make one too, to show to your group of children and their parents and carers.

The box may include:

- photos of important people and pets
- a favourite toy or book
- objects from a special trip 

This encourages children to share and engage in meaningful interactions, about things that are important and familiar to them.

As part of this activity, you might:

- introduce new vocabulary
- ask questions, allowing children time to answer to learn more about the child and their parents or carers
- encourage children to practise using new vocabulary in a meaningful context

This activity will also help to develop the important relationships between you, the children and their parents and carers, which will support warm and positive interactions in the future.

###How the activity links to the other areas of learning

Developing [relationships](/personal-social-and-emotional-development/relationships) through communication and sharing experiences supports [personal, social and emotional development](/personal-social-and-emotional-development) as well as early [literacy](/literacy) skills. Being able to connect socially as well as use language to explain ideas and share thinking with others is central to successful learning in all areas.

##Other activities

Simple games like 
[blowing bubbles in this clip from the community children’s health partnership](https://www.youtube.com/watch?app=desktop&v=PgpddACbPSs&feature=youtu.be)
can help children to take turns and communicate from an early age.
 
[Speech language and communication strategies and resources](https://resources.leicestershire.gov.uk/education-and-children/early-years/childcare-practice/teaching-learning-and-assessment/every-child-a-talker-ecat/strategies-and-resources) from birth to 5.

##What other nurseries and childminders are doing

^“In practice we use ‘Ask me about…’ stickers to encourage communication through positive adult-child interactions. Practitioners will write a brief note on a sticker about something interesting each child has done at pre-school that day and give it to the child to share. Children and their parents or carers can then talk about it together on their way home. The intention was to spark discussion, create opportunities for meaningful interactions, and develop those important two-way relationships between early years providers and home.”^

Anna, Noah’s Ark Preschool, Northamptonshire.

##Summary

- Children are born to communicate and will seek out interaction.
- Good interactions and conversations depend on social relationships and tuned-in adults.
- A well-planned language rich environment is important to facilitate good interactions.
- Planning and reflecting on the quality and time available for conversations will increase opportunities for learning language and communication skills.
- Listening, asking open questions, commenting, repeating, extending, adapting, and valuing non-verbal communication will support children’s communication.

##Next steps

- Consider if you make enough time and space for conversations based on the interests of children.
- Make sure your interactions support the children’s communication and language.
- Make sure that your interactions reflect the individual communication needs of each child.
- Consider if the learning environments are set up in a way that enables communication and talk.
- Review your curriculum to ensure you cover the requirements in the EYFS for this area of learning.

$CTA

**Get alerts for new EYFS resources**

[Sign up to get emails when we add new early years foundation stage resources to this website](https://docs.google.com/forms/d/e/1FAIpQLSdZbPz-447CADTErT9eD1IU4yKfsEhyJy1C8U1fyFAQuEtejw/viewform?usp=sf_link)

$CTA
', '2021-02-23 17:48:29.217556', '2022-09-06 13:24:25.806848', 1, 1, 2, 1, 't', 'Helen Rapp', 'Learn more about interactions as part of the early years foundation stage (EYFS) including advice from experts and suggested activities.', '{:.contents-list__list}
* {:.contents-list__list-item .contents-list__list-item--dashed} [Why interactions are important](#why-interactions-are-important)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Video](#video)
* {:.contents-list__list-item .contents-list__list-item--dashed}[What the EYFS framework says](#what-the-eyfs-framework-says)
* {:.contents-list__list-item .contents-list__list-item--dashed}[What this means in practice](#what-this-means-in-practice)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Suggested activities](#suggested-activities)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Other activities](#other-activities)
* {:.contents-list__list-item .contents-list__list-item--dashed} [What other nurseries and childminders are doing](#what-other-nurseries-and-childminders-are-doing)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Summary](#summary) 
* {:.contents-list__list-item .contents-list__list-item--dashed} [Next steps](#next-steps)   ', 'Learn more about interactions as part of the early years foundation stage (EYFS), including advice from experts and suggested activities.'),
(4, 'Listening and understanding', 'listening-and-understanding', '##Why listening and understanding is important

Communication requires 2 foundation skills, listening and understanding. Children develop these by observing and reacting to others. This influences communication and talking later in life.

Listening is different to simply hearing. It means interpreting different sounds, while beginning to understand social interactions. Understanding means processing what’s being communicated, beginning with simple ideas and vocabulary.

Most babies are born able and eager to interact, but some need extra support. You can play an important part in all children’s overall communication development. Listen to children’s interests and engage in warm interactions with them. Use children’s names to get their attention and keep it.

Children should develop close listening and attention skills, so do not have music on all the time. Think also about playing a variety of sounds, such as environmental noises like rain or the rainforest, as well as stories and rhymes.

In return listen closely to the children. Attend to their wants, needs and individual interests. Children will feel their input is valued, and that they’re appropriately supported. They’ll be much more motivated to listen, understand and learn from others.

##Video

In this video, an early years expert explains the importance of listening and understanding in the early years foundation stage framework. There are also some tips on how to support children in this area.

$YoutubeVideo[OPTIONAL TITLE](https://www.youtube.com/watch?v=wLPQ0Ah75I0&list=PL7914115EB65911A5&index=2)$EndYoutubeVideo

##What the EYFS framework says
By commenting on what children are interested in or doing, and echoing back what they say with new vocabulary added, practitioners will build children''s language effectively. Reading frequently to children, and engaging them actively in stories, non-fiction, rhymes and poems, and then providing them with extensive opportunities to use and embed new words in a range of contexts, will give children the opportunity to thrive.

[Statutory framework for the early years foundation stage](https://www.gov.uk/government/publications/early-years-foundation-stage-framework--2), page 8.

##What this means in practice
To support early listening and understanding, consider your setting''s physical and emotional environment. Children should be able to practise listening closely, and be encouraged to focus their attention. They will benefit from a quiet environment when they are learning to listen and understand. There are different attention stages:

- Generally between 0 and 1 year, children are easily distracted. Keep their attention by giving them your full attention. Demonstrate focus when playing with and responding to them. Use wait-and-see activities such as ''peek-a-boo''.
- Generally between 1 and 2 years, children can keep focus but cannot shift it alone. Support early understanding with instructions, gestures and prompts, for example showing a child their nappy before changing it. Respond to their play and words, to help them concentrate and listen.
- Generally between 2 and 3 years, children can shift focus between tasks more easily. However, they will need your support. Do this through light touch and using their name.
- Generally between 3 and 4 years, children pay attention to different things at the same time. However they may still find this difficult and need support. Use clear prompts to help them switch their attention between tasks and listen to instructions. Something like calling their name, followed by a simple sentence like ‘please stop and listen’ would work well. This prepares them for the more structured learning in the reception year.

##Suggested activities

###Songs to encourage sound and word play

![A practitioner signing to children with actions](https://help-for-early-years-providers.education.gov.uk/rails/active_storage/blobs/proxy/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBc0VCIiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--b7254872329036ff807c638204e006ef8e6582be/comms&lang_listening_activity1%20(1).jpg "A practitioner signing to children with actions")

Children love singing silly songs, especially involving actions, movement and laughter. Playing around with sounds can develop listening skills in a fun way, encouraging confidence with new words. Changing words in familiar songs is great fun, and children can consider the sound differences they hear.

You’ll need some of your favourite songs that have easy words to play with.

Try these examples of song word play:

- ’Polly puts the pizza in’, to the tune of ‘Polly put the kettle on’. Change the verses with different children’s names, such as:
   -  ‘Suzie sizzles sausages’
   -  ‘Ben bites biscuits bit by bit’
   -  ‘Carly crunches cabbages’
- ’A Hedgehog is very prickly’ - to the tune of ‘One finger, one thumb, keep moving’.
   - ’A hedgehog is very prickly
   - A hedgehog is very prickly,
   - A hedgehog is very prickly
   - He couldn’t be anything else!’

Choose a new animal, changing the describing word each time, such as ‘a crocodile is very snappy’, ‘a kitten is very fluffy’.

You can choose whichever songs you like, in line with current classroom themes or children’s special interests.

These song examples are from ‘Bingo Lingo’, by Helen MacGregor.

###How this activity links to the other areas of learning

Children can learn different ways of using songs and words [(widening vocabulary)](/understanding-the-world/widening-vocabulary). They will consider how similar sounds can be amusing [(comprehension)](/literacy/reading-comprehension). They can explore the fun of song and performance [(expressive arts and design)](/expressive-arts-and-design). They can learn how to work with others while having fun and learning [relationships](/personal-social-and-emotional-development/relationships).

###Listening treasure boxes 

You’ll need items that make interesting noises in a ''treasure box'', for example:

- crinkly paper
- noise-making toys
- pots and pans
- musical instruments

Introduce the box to a small group of children, encouraging them to explore the items.

Listen carefully to individual sounds as the children take turns. Turn-taking is also an important communication skill, needing careful listening.

With older, more capable children, get them to take turns bringing an item behind a screen, making the noise while the group guesses what it might be.

Once the group is familiar with all items, take one away and ask if they can remember, replicating or even describing its noise.

The box can be left out for children to explore freely, with positive interactions from you to support listening development.

###How the activity links to other areas of learning

Children can learn how to hold instruments and other noise-making materials [(fine motor skills)](/physical-development/fine-motor-skills). They can arrange the best way to cooperate with friends and take turns [(relationships)](/personal-social-and-emotional-development/relationships). They can develop their memory skills to think about which items might be missing [(patterns and connections)](/mathematics/patterns-and-connections). They can develop their skills around music and performance [(expressive arts and design)](/expressive-arts-and-design).

##Other activities

[Every Child a Talker](https://resources.leicestershire.gov.uk/education-and-children/early-years/childcare-practice/teaching-learning-and-assessment/every-child-a-talker-ecat/strategies-and-resources), various activities for children aged 0 to 5.

[Confident communicators](https://youtu.be/IMXrCgvlJTI) a video about communication and understanding.

Learn [Makaton](https://makaton.org/) - a unique language programme that uses symbols, signs and speech to enable people to communicate. 

##What other nurseries and childminders are doing

^”We use ‘sound bags’ in focused small groups, suitable for children 15 to 18 months, but easily adapted. Use a calm, quiet, distraction-free space. For smaller settings, this may be whilst other children are napping or engaged in independent activities. Gather some objects in a bag, represented by a sound. Choose familiar or motivational objects for a specific child, such as their favourite animal. Get children’s attention by showing the bag, bringing objects out one-by-one and making the sound. Let the chosen child hold and play with each object, providing a multi-sensory approach. Ask them to take turns listening and finding objects for each sound. If a child seems comfortable, encourage them to make the object’s sound themselves, but do not force this. To adapt to each child’s needs, use signs or symbols, rather than sounds, and encourage them to explore objects using the sense they rely on most.”^

Amy, Pen Green Centre, Northamptonshire.

##Summary

- Basic communication begins with two important skills: listening, and understanding.
- Listening and understanding are the foundation for later learning and development, for example talking, writing, and communicating with friends.
- Good listening and understanding helps with all EYFS areas, particularly developing social skills, attention, following instructions and wider communication.
- Babies, toddlers and young children must develop the ability to focus and maintain concentration, in order to learn.
- Listening, which is different to hearing, means interpreting sounds and understanding their source, as well as meaning.

##Next steps

- Consider your setting’s physical and emotional environment.
- Consider opportunities for children to listen and understand sounds.
- Discuss the importance of listening and understanding with parents and carers.
- Notice and make time for listening and understanding during everyday interactions.
- Review your curriculum to ensure you cover the requirements in the EYFS for this area of learning.

$CTA

**Get alerts for new EYFS resources**

[Sign up to get emails when we add new early years foundation stage resources to this website](https://docs.google.com/forms/d/e/1FAIpQLSdZbPz-447CADTErT9eD1IU4yKfsEhyJy1C8U1fyFAQuEtejw/viewform?usp=sf_link)

$CTA
', '2021-02-23 17:48:29.228228', '2022-09-06 13:25:45.446474', 1, 3, 21, 2, 't', 'Helen Rapp', 'Learn more about listening and understanding as part of the early years foundation stage (EYFS) including advice from experts and suggested activities.', '{:.contents-list__list}
* {:.contents-list__list-item .contents-list__list-item--dashed} [Why listening and understanding is important](#why-listening-and-understanding-is-important)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Video](#video)
* {:.contents-list__list-item .contents-list__list-item--dashed}[What the EYFS framework says](#what-the-eyfs-framework-says)
* {:.contents-list__list-item .contents-list__list-item--dashed}[What this means in practice](#what-this-means-in-practice)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Suggested activities](#suggested-activities)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Other activities](#other-activities)
* {:.contents-list__list-item .contents-list__list-item--dashed} [What other nurseries and childminders are doing](#what-other-nurseries-and-childminders-are-doing)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Summary](#summary) 
* {:.contents-list__list-item .contents-list__list-item--dashed} [Next steps](#next-steps)   ', 'Learn more about listening and understanding as part of the early years foundation stage (EYFS), including advice from experts and suggested activities.'),
(5, 'Expressive arts and design', 'expressive-arts-and-design', 'Access resources, activity ideas and advice for teaching expressive arts and design to early years children.

##Early years expressive arts and design resources

Resources are split into 3 areas based on the educational programmes: 

[Imagination and creativity](/expressive-arts-and-design/imagination-and-creativity)

[Self-expression](/expressive-arts-and-design/self-expression)

[Communicating through arts](/expressive-arts-and-design/communicating-through-arts)

These resources will help you when reviewing your current curriculum to make sure you are meeting the requirement of the revised expressive arts and design area of learning.  

As you make changes to your curriculum consider what you want children to learn first and plan opportunities for them to achieve this.

## What the early years foundation stage (EYFS) framework says about expressive arts and design

The development of children’s artistic and cultural awareness supports their imagination and creativity.

<details class="govuk-details">
<summary class="govuk-details__summary">
<span class="govuk-details__summary-text">
Read more
</span>
</summary>
<div class="govuk-details__text">

<p>It is important that children have regular opportunities to engage with the arts, enabling them to explore and play with a wide range of media and materials.</p>

<p>The quality and variety of what children see, hear and participate in is crucial for developing their understanding, self-expression, vocabulary and ability to communicate through the arts.</p>

<p>The frequency, repetition and depth of their experiences are fundamental to their progress in interpreting and appreciating what they hear, respond to and observe.</p>

</div>
</details>

$CTA

**Get alerts for new EYFS resources**

[Sign up to get emails when we add new early years foundation stage resources to this website](https://docs.google.com/forms/d/e/1FAIpQLSdZbPz-447CADTErT9eD1IU4yKfsEhyJy1C8U1fyFAQuEtejw/viewform?usp=sf_link)

$CTA', '2021-02-23 17:48:29.237092', '2021-12-17 15:32:10.380253', NULL, 7, 6, 28, 't', 'Helen Rapp', '', '', ''),
(6, 'Imagination and creativity', 'imagination-and-creativity', '##Why imagination and creativity are important

Having an imagination is the ability of the mind to be creative and resourceful. 

Creativity is children’s unique response to all that they see, hear, feel and experience. A child’s individual responses to materials, experiences and ideas inspire their creativity and imagination. 

Children’s responses can be physical, emotional, social, cultural or a combination. Younger children might respond in verbal and non verbal ways, for example, a toddler swaying to music.

For young children to have an individual response it’s important you do not have a set goal. Children need their contributions to be noticed and valued so they build confidence and resilience. 
Give children enough space and time to experience and explore. Help and encourage them to develop their own curiosity and creativity. A child’s imagination and creativity are enriched through their awareness of art and other children around them. 
All of these creative experiences build powerful connections within the brain, Creativity is associated with focus, independence, a willingness to explore and ingenuity.
 
As children develop in imagination and creativity they are able to tell a story, relate to other people, keep themselves emotionally grounded and enter their imaginary worlds.

##Video

In this video, an early years expert explains the importance of imagination and creativity in the early years foundation stage framework. There are also some tips on how to support children in this area.


$YoutubeVideo[OPTIONAL TITLE](https://www.youtube.com/watch?v=TsaRTfysKmY&list=PL7914115EB65911A5&index=2)$EndYoutubeVideo

##What the EYFS framework says

The development of children’s artistic and cultural awareness supports their imagination and creativity. It is important that children have regular opportunities to engage with the arts, enabling them to explore and play with a wide range of media and materials. 

[Statutory framework for the early years foundation stage](https://www.gov.uk/government/publications/early-years-foundation-stage-framework--2), page 10.

##What this means in practice

To support children’s creativity and imagination you will need to consider the range of what you offer. 
 
Use a wide range of interesting and beautiful found materials, like wallpaper and fabric. Fabrics, fastenings and accessories for roleplay can have more potential than dressing-up costumes. Exploring materials and media inspires children to think flexibly and creatively. 

Stimulate children by using different materials for exploration. Give them plenty of multi-sensory experiences and the opportunity to see images of art works. Eventually children will offer their own thoughts about their experiences. ‘This feels like a cuddle’ (a 3 year old exploring a strip of velvet).

You need to be confident and give children time to respond to the things they see, hear and experience at their own individual level. This is as relevant to babies as it is to older children.

Focus on the experience rather than have a defined outcome. Children’s responses or representation may be different to what you expected, you should welcome this.
 
All children have their own creative and imaginative responses. Encourage and notice the children’s responses. Knowledge of the children can help you plan ahead.

##Suggested activities

###Have a musical ‘jam’ session
![A table of musical instruments](https://help-for-early-years-providers.education.gov.uk/rails/active_storage/blobs/proxy/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBdjhCIiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--818e9f4848c16c065fd6153f5cdd04c4541283f1/expressivearts_imagination_activity1.jpg "A table of musical instruments")

You’ll need:

- trays, colanders, different sized plastic containers or pans that can be beaten with a wooden spoon
- whisks in saucepans
- shakers made from small plastic containers filled with rice, lentils or pasta
- pan lids for banging together like cymbals
- straws to blow bubbles in glasses of water
- corrugated cardboard
- paper bags for scrunching up
- metal tongues for clicking together like castanets

Let the children explore sounds that can be made from ordinary household objects.  Encourage links with parents or carers and ask them to help their child choose things from their kitchen cupboards at home. Challenge the children to make sounds from all the objects and utensils. 

Bring in similar objects from home to compare and contrast with any traditional instruments you have, for example, drums, maracas or bells.  

You might want to use music to help you carry out the activity. For example, use a favourite song, nursery rhyme or action song. You could ask the children to play to the beat of the song.

Introduce children to language to describe the sounds they are making. Talk with the children about how the sound is being made and show interest in how many sounds they can make from one instrument. Can they change the sound of the instrument by playing it in a different way?

Use strips of paper or white boards and pens to allow the children to experiment with making marks to represent each sound. They could also represent sounds in the form of movements too.

###How this activity links to the other areas of learning

[Physical development](/physical-development) is supported by moving and handling objects and toys and moving to music. [Literacy](/literacy) is encouraged by writing making marks.  Musical activities are good for communication skills in speaking, listening and understanding and [personal, social and emotional development](/personal-social-and-emotional-development).

###Making a house for a superhero
![A superhero model](https://help-for-early-years-providers.education.gov.uk/rails/active_storage/blobs/proxy/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBZ0FDIiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--3379a5a2807d37e2f63ac1f02640adf7324d6282/expressivearts_imagination_activity2.jpg "A superhero model")

You’ll need:

- a superhero toy (or a favourite teddy or soft toy)
- pieces of fabric
- a range of construction materials/kits
- a collection of found materials
- materials for fixing materials, like masking tape
- pictures of superheroes or teddies
- pictures of houses and other buildings
- non-fiction books about homes and buildings
- story books with superhero characters or teddies and soft toys as characters
- construction area

From your observations of the children engaged in self-initiated play you will have knowledge and understanding of their favourite television characters, soft toys or superheroes. Very young children may be interested in putting their toys in pieces of fabric. Playing peek-a-boo and hide and seek are good ways to extend their play, in ways that are sensitive to their needs.

For older children, choose a superhero that’s popular in the setting, for example Super Daisy or Spider Man. Provide pictures of the superhero and a superhero toy. Suggest to the children that they could make a house for her/him so that he can live in the setting. If you do not have a superhero toy in your resources, improvise with dolls’ house figures. These interactions invite children to listen and to use spoken language to  imagine, recall stories, predict and give each other instructions.

At first see what the children do spontaneously. Which construction materials do they use? Is it the wooden blocks? How successful are they? What do they imagine the superhero’s house to be like? Are they able to create their own unique, ‘superhero’s house? The complexity of their constructions will depend on their fine motor control and skills. Remember for children, a pile of bricks is as representative of a ‘home’ as a built construction out of bricks.

Either on that day, or maybe a few days later, depending on how the children respond, start to make some suggestions, point out that they may need to make their buildings stronger, bigger, smaller or more fit for purpose for their superhero. Bring books and images in to show a range of different houses.

###How this activity links to the other areas of learning

Constructing with a variety of materials develops the children’s [fine motor skills](/physical-development/fine-motor-skills), including muscular strength and hand-eye-coordination. Superhero play provides children with an emotional outlet as well as opportunities for playing in a group. To further develop [communication and language](/communication-and-language) skills children can share their ideas, direct each other, describe their models and tell their own superhero stories.  Scribing the children’s superhero stories supports their future writing skills. The children may want to illustrate these. You can provide story books as suggested, to support the children’s [literacy](/literacy) learning. The construction process, whether on a small or large scale, develops children’s use of technological and scientific language [(understanding the world)](/understanding-the-world). Children can consider which materials work best and why. 

##Other activities

Develop children’s imagination and creativity with visits to local venues such as parks, parks with sculptures, art galleries, museums or libraries. These are often free or at a low cost to under-5s. 

[Tate kids](https://www.tate.org.uk/kids) has a wide range of online videos to support and inspire activities from sound creatures to colour walks.

##What other nurseries and childminders are doing

^“In our nurseries we see the expressive arts and design part of the curriculum as an opportunity for the children to experience everything in a way that is bigger and messier. We provide a wide range of materials with lots of everything.”^

Mandy, Naturally Learning, Truro.
 
^“We don’t buy any of our collage materials, everything is ‘found’. Parents bring in bottle tops, old hats and handbags. We go to charity shops too.”^

Julie, childminder, Ilkley.

##Summary 

- Imagination and creativity are children’s unique response to what they see, hear and experience around them.
- Children have a natural curiosity to explore experiences. Non-verbal and verbal creative expression must be valued and noticed.
- Repetition allows children to explore and make sense of their experiences and to respond in their own unique way. 

##Next steps

- Think about how you use resources to develop children’s imagination and creativity.
- Make sure children have repeated opportunities for imaginative play.
- Find out what other providers are doing and then try out new ideas.
- Review your curriculum to ensure you cover the requirements in the EYFS for this area of learning.

$CTA

**Get alerts for new EYFS resources**

[Sign up to get emails when we add new early years foundation stage resources to this website](https://docs.google.com/forms/d/e/1FAIpQLSdZbPz-447CADTErT9eD1IU4yKfsEhyJy1C8U1fyFAQuEtejw/viewform?usp=sf_link)

$CTA


', '2021-02-23 17:48:29.247261', '2022-09-06 13:32:12.55912', 5, 1, 7, 5, 't', 'Helen Rapp', 'Learn more about imagination and creativity as part of the early years foundation stage (EYFS) including advice from experts and suggested activities.

', '{:.contents-list__list}
* {:.contents-list__list-item .contents-list__list-item--dashed} [Why imagination and creativity are important](#why-imagination-and-creativity-are-important)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Video](#video)
* {:.contents-list__list-item .contents-list__list-item--dashed}[What the EYFS framework says](#what-the-eyfs-framework-says)
* {:.contents-list__list-item .contents-list__list-item--dashed}[What this means in practice](#what-this-means-in-practice)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Suggested activities](#suggested-activities)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Other activities](#other-activities)
* {:.contents-list__list-item .contents-list__list-item--dashed} [What other nurseries and childminders are doing](#what-other-nurseries-and-childminders-are-doing)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Summary](#summary) 
* {:.contents-list__list-item .contents-list__list-item--dashed} [Next steps](#next-steps)   ', 'Learn more about imagination and creativity as part of the early years foundation stage (EYFS), including advice from experts and suggested activities.'),
(7, 'Self-expression', 'self-expression', '##Why self-expression is important

Self-expression, through being creative and playing with materials, encourages and supports children’s imagination and thinking process development. It allows them to produce new understandings, experiencing the world from different perspectives. Opportunities to manipulate materials are essential for children to develop their skills and express themselves.

Have a good range of ‘open-ended materials’ that children can use how they like, constructing, manipulating and transforming them through self-directed play. This allows them to explore and inquire in an active and participatory way, expressing their thoughts, actions and ideas in many different ways. They also learn to appreciate the creative work of others, including art, music, dance and performance.

The more confident children are with the range of materials they have to explore and use imaginatively, the more skilful they become in expressing themselves. They will be able to communicate their original ideas, which they could struggle with in other situations.

Exploring open-ended materials supports children with English as an additional language, or those with limited verbal communication skills.

##Video

In this video, an early years expert explains the importance of self expression in the early years foundation stage framework. There are also some tips on how to support children in this area.


$YoutubeVideo[OPTIONAL TITLE](https://www.youtube.com/watch?v=k_qMllzI-Tc&list=PL7914115EB65911A5&index=1)$EndYoutubeVideo

##What the EYFS framework says

Children’s artistic and cultural awareness development supports their imagination and creativity. It’s important that they have regular opportunities to engage with arts, enabling them to explore and play with a wide range of media and materials. The quality and variety of what children see, hear and participate in is crucial for developing their understanding, self-expression, vocabulary and ability to communicate through arts.

[Statutory framework for the early years foundation stage](https://www.gov.uk/government/publications/early-years-foundation-stage-framework--2). Page 10

##What this means in practice

Have a good range of open-ended materials that children can choose how to use. Consider having: 

- different mark-makers
- a range of paints and brushes
- different textures, sizes, colours and shapes of paper and card
- clay or other modelling materials
- found collage materials
- found materials such as boxes, tubes and lids
- roleplay materials
- small world play
- space for dance, movement and music
- instruments, or other things to make music with

Make sure these are well-organised, safe and accessible to children. Allow them to choose the materials they want to use. 

Describe what children are doing as they do it, in a gentle and sensitive way. Use words to describe the materials provided, as well as their colours, patterns and shapes. Use positional, dynamic language, such as vertical, horizontal, rotation, spiral, dabs.

Be confident and familiar with all materials. Spend some time exploring them yourself. Understanding each material’s wide range of possibilities helps you observe how children respond to them.

##Suggested activities

###Discovering materials

Collect a range of materials from around your setting, try to collect with size and interest in mind as well as type of materials. You can provide a collection or you may also wish to go on a hunt with the children. For example look in the kitchen, what is made of wood? Can we find 5 things made from plastic?
 
Look for different types of materials, such as wood, metal, paper, cardboard, clay, plastic, stone, ceramics or shells. You may collect a single type of material that is expressed in different forms, such as large metal nuts and bolts and washers.
 
Think about the different properties of the materials you’re collecting: clear, opaque, dense, light, reflective, colourful, plain, rough, smooth, patterned or plain.
 
Arrange your materials on a surface, at a table, or on a mat on the floor and let the children play and explore the materials. It’s also useful to think about a single colour, such as black card that can provide a base to work on and arrange the collection on. If you have a large collection you may wish to use a frame, a hoop or wooden frame for the children to place their chosen materials inside.
 
Listen to what the children say about the materials as they handle them, how are they expressing their ideas, are they talking about properties or naming the type of materials?
 
Observe what the children do with the different materials and ask them questions about what they are discovering. How do they handle them, are they exploring the texture. Do the materials they have selected have something in common for example are they all shiny or smooth.

Try to notice what has interested the children, is it shape, texture, function or size? The children’s selection expresses their interest and tells us a little about them, their knowledge and experience. Are they constructing? Placing and arranging or just handling the materials?
 
Talk with the children about the materials: What do they feel like, what do they look like, do they smell, do they make a sound, what do they remind you of, how do the materials make you feel, how are the materials different, how could you use materials? There are lots of opportunities to provide a rich dialogue, adding descriptions, ideas and thoughts and feelings about materials.

###How this activity links to the other areas of learning

Gathering the materials with the children, will help to motivate further exploration later and supports their [personal, social and emotional development](/personal-social-and-emotional-development). When talking about the properties of materials children engage in [communication and language](/communication-and-language). They describe their explorations and discoveries supporting their [literacy](/literacy) skills. Manipulating small and large objects develops their [fine motor skills](/physical-development/fine-motor-skills) and [gross motor skills](/physical-development/gross-motor-skills). Enriching and widening their vocabulary as well as developing children’s observations of differences and similarities, helps their [understanding the world](/understanding-the-world). Manipulating materials varying in size, quantity, weight and type strengthens children’s understanding of [mathematics](/mathematics).

###Make our own paint
![A child painting](https://help-for-early-years-providers.education.gov.uk/rails/active_storage/blobs/proxy/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBZ0VDIiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--e0709262a1ff0e0f292c6c0ea3d6ecf21362c758/expressivearts_selfexpression_activity2.jpg "A child painting")

You’ll need:

- paintbrushes, glue spreaders, objects for printing
- natural materials for making marks, such as, twigs, leaves, pebbles for rolling
- paper, different textures, thicknesses, shapes and sizes, bark, cardboard
- water pots
- printing trays

Help the children to make their own paint. A basic paint recipe is flour, water and food colouring. Experiment with different consistencies, from very thick, like acrylic and oil paints, to runny like water colours.

You could also try an outdoor paint recipe from mud and water. Children can experiment with different consistencies. Children who are reluctant to paint in the indoor art area may be happy to make their marks outside. 

There are potential ingredients in the kitchen cupboards. Instant coffee makes beautiful glossy paint. Turmeric and mustard powder make bright yellow paint, but be careful because it stains very easily. You could also try using tea bags. 

You could use things from the garden. Use soft fruits by sieving them to make shades of blue and red. Beetroot, rose petals, grass and leaves also make shades of red, green and brown. 

Arrange the materials so that the children can reach them and see how they approach the activity. Give them time to explore, experiment and discover for themselves. 

Listen to how they express themselves as they make thick and runny paint and a range of colours. Older children may describe their creations and you can scribe their words for them. 

Watch how they manage the tools and paint. Children are frequently fascinated by the changes in colour, texture and consistency and do not necessarily want to make marks on paper. This is fine and shows that they need more experience before they do this. 

Talk to the children by describing what you see them doing and the colours they create. If they make marks on paper, describe those too. For example, vertical, horizontal, diagonal, up and down, across, rotating, circular, round and round, dabs, shading an area, shading the whole piece of paper.

###How this activity links to the other areas of learning

This activity enriches children’s [understanding of the world](/understanding-the-world) in scientific, technological and ecological areas. Making paint and colour mixing stimulate and develop children’s [communication and language](/communication-and-language) skills. Children use talk to describe what they see and feel, they direct and tell each other how they created different paints and colours. Confident talk helps [literacy](/literacy) skills. Using paintbrushes, natural materials and other small tools supports the development of [fine motor skills](/physical-development/fine-motor-skills). Children often cover the whole paper providing the experience of area, size and shape [(mathematics)](/mathematics).

##Other activities

Self-expression does not always need bought materials and musical instruments. Try using found materials, such as:

- natural materials found on walks
- recycled materials such as cardboard cylinders, boxes, fabrics or carpet squares

[Bomomo](https://bomomo.com/) is an online art program children can interact with to create designs.

[How to make edible paint](https://www.learning4kids.net/2014/10/07/homemade-edible-finger-paint/) using cornflour, suitable for babies from 6 months from learning 4 kids.

[Painting with Petals](https://www.growwilduk.com/blog/painting-petals) from the Royal Botanic Gardens.

[Soil Art](https://kidsgardening.org/garden-activities-soil-art/) from kids gardening

##What other nurseries and childminders are doing

^“We have children aged 1 to 4 years, so we let the babies immerse themselves in the materials, alongside the older children. When we are making playdough in my childminding setting, I expect the older children to know how to make it without any adult help. The babies sit in a Tuff Tray and experience the flour.”^

Julie, childminder, Ilkley.

^“We are experimenting with different materials for painting. Mud Art outside works very well. The children use found materials, such as, twigs, leaves, seed heads to make marks, as well as using their hands. Children use large pieces of bark for the background”.^

Mandy, Naturally Learning, Truro.

##Summary

- Exploring materials helps children to express themselves and communicate their thoughts, actions and ideas in many different ways.
- A good range of quality materials will help children develop their creativity. 
- You can use found materials as well as more traditional bought art materials.
- Children’s interaction and exploration with materials supports their wider knowledge and understanding of the world around them.
- When you speak to the child about what they’re doing, use rich descriptive language.

##Next steps

- Review the materials you provide to make sure you have a good range of open-ended materials.
- If you have to pack everything away every day, decide in advance what children will have access to each day. Try to include an opportunity for ‘messy’ play every day.
- Consider questions that are not too intrusive for children when they’re immersed in the creative process.
- Consider finding a local artist who is interested in working alongside young children. Make sure there’s a shared understanding of the unique qualities of a child’s creations and imagination.
- Share photographs of what you provide with others to create a network of ideas to keep things fresh and exciting for the children and their parents and carers.
- Review your curriculum to ensure you cover the requirements in the EYFS for this area of learning.

$CTA

**Get alerts for new EYFS resources**

[Sign up to get emails when we add new early years foundation stage resources to this website](https://docs.google.com/forms/d/e/1FAIpQLSdZbPz-447CADTErT9eD1IU4yKfsEhyJy1C8U1fyFAQuEtejw/viewform?usp=sf_link)

$CTA', '2021-02-23 17:48:29.258321', '2022-09-06 13:32:35.801986', 5, 2, 8, 6, 't', 'Helen Rapp', 'Learn more about self-expression as part of the early years foundation stage (EYFS) including advice from experts and suggested activities.', '{:.contents-list__list}
* {:.contents-list__list-item .contents-list__list-item--dashed} [Why self-expression is important](#why-self-expression-is-important)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Video](#video)
* {:.contents-list__list-item .contents-list__list-item--dashed}[What the EYFS framework says](#what-the-eyfs-framework-says)
* {:.contents-list__list-item .contents-list__list-item--dashed}[What this means in practice](#what-this-means-in-practice)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Suggested activities](#suggested-activities)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Other activities](#other-activities)
* {:.contents-list__list-item .contents-list__list-item--dashed} [What other nurseries and childminders are doing](#what-other-nurseries-and-childminders-are-doing)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Summary](#summary) 
* {:.contents-list__list-item .contents-list__list-item--dashed} [Next steps](#next-steps)   ', 'Learn more about self-expression as part of the early years foundation stage (EYFS), including advice from experts and suggested activities.'),
(8, 'Communicating through arts', 'communicating-through-arts', '##Why communicating through arts is important 

Communication and expression are the ways children share their responses to what they see, hear and experience. Creative expression supports children’s emotional wellbeing and reduces anxiety. It’s how children represent themselves, their thoughts and feelings as they develop their ideas. 

Self-expression is children’s way of showing what they understand and know, through exploring:

- materials
- painting 
- sculpting 
- singing 
- dancing
- roleplaying 

Children with English as an additional language may find creative expression becomes their first way of communication in your setting.
 
Children can express their feelings through dance. Children will show confidence in the way they can move their whole bodies as well as isolate movements with their arms, hands, legs and feet. Older children are able to express themselves in the way they use materials for art and design.

Children are aware of performance from a young age. They understand what it means to have a performer and an audience. Some children have a need to ‘perform’ every day and will find a performance area for themselves, inside or outside.
 
When you respond to children’s self-expression you gain an insight into their thoughts and experiences. It allows you to respond by praising, mirroring, repeating and considering what they are doing. 

##Video

In this video, an early years expert explains the importance of communicating through arts in the early years foundation stage framework. There are also some tips on how to support children in this area.


$YoutubeVideo[OPTIONAL TITLE](https://www.youtube.com/watch?v=Ri1hEERw46s&list=PL7914115EB65911A5&index=3)$EndYoutubeVideo

##What the EYFS framework says

The quality and variety of what children see, hear and participate in is crucial for developing their understanding, self-expression, vocabulary and ability to communicate through the arts.

[Statutory framework for the early years foundation stage](https://www.gov.uk/government/publications/early-years-foundation-stage-framework--2). Page 10

##What this means in practice

Arts should be introduced as early as possible. For babies, exposure to music, art, movement and dance is a multi-sensory experience. For example, babies are aware in their first few days of a screen in the room at home.

Observe very young children and see how they respond to colours, lights, reflections, sounds and noise in your setting. Tuff trays are a good resource for giving very young children tactile experiences that they can immerse themselves in.
 
In practice, creative expression takes place when children are given time and space with reassurance and encouragement from adults. Avoid asking direct ‘outcome’ based questions like ‘what are you making?’ or ‘what is it?’ Young minds do not operate creatively in that way. Instead describe what you see, colours, shapes, movement, materials, sounds, lines or feelings, providing rich language for the child.
 
You can model skills such as cutting with scissors, but this must be carefully balanced with giving children the freedom to express themselves. Children may need to be taught to use these types of tools in order to support their self-expression.

##Suggested activities 

###Communication through music

![Children dancing](https://help-for-early-years-providers.education.gov.uk/rails/active_storage/blobs/proxy/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBZ0lDIiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--d0fbf24956a629581a8b75d322653ecfe30274ec/expressivearts_communicating_activity1.jpg "Children dancing")

Ask the children to tell you their favourite song to listen, move, dance or sing to at home. It could be one for each child in a nursery or a whole set of favourites for a childminder.

Make a playlist of the songs for the children to listen to in different situations, for example while having a snack, playing, or playing outside. 

Give them time to listen to the songs and respond to them. Notice these responses (verbal, movements and gestures). Let them have a ‘disco time’ where they have a chance to respond through movement to the music. If there are any action songs or rhymes in the playlist make sure you give the children the opportunity to practice these to the music.  Allow for children to lead others and teach the moves. 

Make a list of the songs to give parents so they too can become familiar with the songs and enjoy listening, moving and talking about them at home.  

Pick one song from the list and ask them to switch on their ‘listening ears’. Talk about which child likes this song. Share with the children anything you have noticed about how they have responded to it while it has been played. Is there a chorus and a verse in the song? Use musical language to reinforce their findings (loud, fast, changing tempo, quick or slow beat, loud, quiet, getting louder, getting quieter). Ask the children to think about how they feel when they hear this song.  Give them time to respond and notice their responses.

Re-visit again at a later time and listen to the same song. Ask the children to think about ways to move to it.  Give them the opportunity to test out their ideas.  Keep re-visiting and each time notice their movements.  Keep a ‘movement vocabulary’ poster of the moves they make, such as stamping, turning, twisting, jumping, spinning or crawling. Can the children identify and give names to the moves they make?

Although movement activities may challenge a child with restricted movement this should not stop them being involved. These children will benefit from inclusivity, working as a team and engaging. Offer isolated body movement ideas, such as arm movements or leg movements, and partner, work, building to larger groups. If children cannot respond through verbal communication, encourage them to respond through vibrations and rhythm through movement.

###How this activity links to the other areas of learning 

This activity links to physical development, specifically [gross motor skills](/physical-development/gross-motor-skills). It also supports [communication and language](/communication-and-language), [personal social and emotional development](/personal-social-and-emotional-development) and [spatial reasoning](/mathematics/spatial-reasoning).

###In the picture

![A child painting](https://help-for-early-years-providers.education.gov.uk/rails/active_storage/blobs/proxy/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBZ0VDIiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--e0709262a1ff0e0f292c6c0ea3d6ecf21362c758/expressivearts_selfexpression_activity2.jpg "A child painting")

Select a work of art that you think will interest the children. You need a good quality reproduction. In choosing an artwork look at the children’s own creations, and consider if there are any repeated patterns or marks that are similar to the artworks.

Show the children the art. To start with you may say something like, ‘I found this picture of an artist’s painting. I thought you might like it because it reminded me of your paintings.’ Ask the children, ‘What do you see?’ ‘What does it make you think of?’

Make sure the art area is well stocked. Give the children resources that match the colours in the art work. This is called a ‘restricted palette’. Include resources for painting, printing and collage. 

During tummy time, reproductions of the artwork can be made available for babies to see and reach out to. They will delight in the sensory experience staring into the vertical lines.

For children with physical needs make sure they can access the materials, this may mean providing them on the floor either inside or outside.

Children with English as an additional language can access this activity through non-verbal communication. They may talk about what they are doing in their home language.
 
For children who have created their own work of art, ask to keep it, photocopy it and re-visit on another day. Children aged 3 to 4 are keen to re-visit and add to their art, often adding more detail.

Children may like to cut up their original artwork and re-create as a collage. They may want to paint or print over the top. Many artists work in this way.

Photograph the process, if you can. Print some images to inspire other children to become involved and support children to recall past events.

###How this activity links to the other areas of learning

This activity links to [personal, social and emotional development](/personal-social-and-emotional-development). Children will create in small groups, and through the extensions socialise amongst their friends in the setting. They may decide to create a picture as a pair or in a small group.

The activity also links to [physical development](/physical-development). Children’s manipulation of art materials further develops their fine motor skills and hand-eye coordination. There is also an implication for larger body movements. 

##Other activities   

Find local art venues, including outdoor places, such as parks, churchyards and memorials.

Look for local spaces where children’s art work and designs can be shown.

A collection of interactive education games including online [patterns, doodles and images](http://toytheater.com/category/art/).

[Articles and ideas](https://earlyarts.co.uk/resources) including puppets, circle times, 
indoor environments, helicopter storytelling and role play.

##What other nurseries and childminders are doing

^“Recently we have hung up a transparent tarpaulin outside and the children have been able to paint it on either side. They love being able to see what their friends are doing. We also use transparent umbrellas. It just gives a different surface and a different perspective. We like to take one art form and make it bigger.”^ 

Julie, childminder, Ilkley.

##Summary

- Expression is the ability to communicate through arts.
- Artistic expression communicates something about children’s ‘self’, their preferences, interests, feelings, own experiences and choices.
- Provide art materials as early as possible. All children can communicate meaning through their responses to materials and experiences. This includes those without language, with English as an additional language or special educational needs (SEND).
- How you respond to children’s expression will affect their willingness to continue to develop that expression.
- The expressive arts support children’s wellbeing and has the potential for very young children to be highly involved for long periods of time.

##Next steps 

- Make sure you have a good amount of materials.
- Consider if it’s possible to take the children to a live performance, or an art gallery. 
- Plan for a range of experiences over time.
- Consider if there are any talented parents and carers or other family members who could visit the children. 
- It’s important to have some knowledge of art, music and design. 
- Review your curriculum to ensure you cover the requirements in the EYFS for this area of learning.

$CTA

**Get alerts for new EYFS resources**

[Sign up to get emails when we add new early years foundation stage resources to this website](https://docs.google.com/forms/d/e/1FAIpQLSdZbPz-447CADTErT9eD1IU4yKfsEhyJy1C8U1fyFAQuEtejw/viewform?usp=sf_link)

$CTA', '2021-02-23 17:48:29.26766', '2022-09-06 13:32:49.864866', 5, 3, 31, 7, 't', 'Helen Rapp', 'Learn more about communicating through arts as part of the early years foundation stage (EYFS) including advice from experts and suggested activities.', '{:.contents-list__list}
* {:.contents-list__list-item .contents-list__list-item--dashed} [Why communicating through arts is important](#why-communicating-through-arts-is-important)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Video](#video)
* {:.contents-list__list-item .contents-list__list-item--dashed}[What the EYFS framework says](#what-the-eyfs-framework-says)
* {:.contents-list__list-item .contents-list__list-item--dashed}[What this means in practice](#what-this-means-in-practice)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Suggested activities](#suggested-activities)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Other activities](#other-activities)
* {:.contents-list__list-item .contents-list__list-item--dashed} [What other nurseries and childminders are doing](#what-other-nurseries-and-childminders-are-doing)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Summary](#summary) 
* {:.contents-list__list-item .contents-list__list-item--dashed} [Next steps](#next-steps)   ', 'Learn more about communicating through arts as part of the early years foundation stage (EYFS), including advice from experts and suggested activities.'),
(9, 'Literacy', 'literacy', 'Access resources, activity ideas and advice for teaching literacy skills to early years children.

##Early years literacy resources

Resources are split into 3 areas based on the educational programmes: 

[Reading comprehension](/literacy/reading-comprehension)

[Exploring words](/literacy/exploring-words)

[Writing](/literacy/writing)

These resources will help you when reviewing your current curriculum to make sure you are meeting the requirement of the revised literacy area of learning.  

As you make changes to your curriculum consider what you want children to learn first and plan opportunities for them to achieve this.

Please bear in mind any current covid restrictions and/or advice when undertaking any suggested activities. 

##What the early years foundation stage (EYFS) framework says about literacy

It is crucial for children to develop a life-long love of reading. Reading consists of two dimensions: language comprehension and word reading.

<details class="govuk-details">
<summary class="govuk-details__summary">
<span class="govuk-details__summary-text">
Read more
</span>
</summary>
<div class="govuk-details__text">

<p>Language comprehension (necessary for both reading and writing) starts from birth.</p>

<p>It only develops when adults talk with children about the world around them and the books (stories and non-fiction) they read with them, and enjoy rhymes, poems and songs together.</p>

<p>Skilled word reading, taught later, involves both the speedy working out of the pronunciation of unfamiliar printed words (decoding) and the speedy recognition of familiar printed words.</p>

<p>Writing involves transcription (spelling and handwriting) and composition (articulating ideas and structuring them in speech, before writing).</p>

</div>
</details>

$CTA

**Get alerts for new EYFS resources**

[Sign up to get emails when we add new early years foundation stage resources to this website](https://docs.google.com/forms/d/e/1FAIpQLSdZbPz-447CADTErT9eD1IU4yKfsEhyJy1C8U1fyFAQuEtejw/viewform?usp=sf_link)

$CTA', '2021-02-23 17:48:29.277618', '2021-12-17 15:20:19.138105', NULL, 4, 10, 19, 't', 'Helen Rapp', '', '', ''),
(10, 'Reading comprehension', 'reading-comprehension', '##Why reading comprehension is important

Oral language development is key to children’s development. Language development can be enhanced by the amount of spoken language a child hears and joins in with. Language comprehension is an important pre-requisite to children being able to understand what they read for themselves, when the teaching of phonics begins in reception. It’s also important to later success with writing composition.

Language development links closely to [listening and understanding](/communication-and-language/listening-and-understanding). Introducing children to a wide range of words they would rarely hear or use increases their knowledge of vocabulary and concepts to help them understand the world around them. Hearing and talking about these words in context helps children to understand. 

Through reading with children you talk about the meanings of words. This starts with you providing and talking about the children’s interests and gradually extending their knowledge about the world around them. 

Listening to stories introduces children to words they would not often hear in everyday speech. It also gives them an awareness of sentence structure. 

You should provide a wide range of reading experiences to help children develop a love of reading, curiosity and wonder about the world around them. Providing a well sequenced reading curriculum to develop children’s knowledge of language and how it works, can create fluent, passionate and lifelong readers.

##Video

In this video, an early years expert explains the importance of reading comprehension in the early years foundation stage framework. There are also some tips on how to support children in this area.

$YoutubeVideo[Reading comprehension video](https://www.youtube.com/watch?v=Nv4L3DHprYQ)$EndYoutubeVideo

##What the EYFS framework says

Language comprehension (necessary for both reading and writing) starts from birth. It only develops when adults talk with children about the world around them and the books (stories and non-fiction) they read with them, and enjoy rhymes, poems and songs together. 

[Statutory framework for the early years foundation stage](https://www.gov.uk/government/publications/early-years-foundation-stage-framework--2). Page 8

##What this means in practice

You should begin by looking at what you want children to learn and then identify how you can provide experiences that allow children to develop their early comprehension skills.

Adults share books with babies. They may just look at a favourite page or picture. When reading to young children, help them ‘read the picture back’ by letting them grab the book or point to the picture.

By providing children with a wide selection of reading material, children can be supported to choose books for themselves. Adults can talk about why they like a book and share what the child likes too. You should let them explore how books open, while talking about what they see or feel. Be patient, letting them ask or answer questions.

Through the regular sharing of books, the children will become more interested in books, and be able to explain what they are about. You should help them guess what happens next. Make the text come alive by using voices, exaggerated facial expressions and body movements to tell the story.

Providing lots of opportunities for children to make their own books, such as a family books, helps children to begin to understand that written words have meanings. This helps them to start to understand print has meaning and that it works from left to right, and top to bottom. 

##Suggested activities

###Reading aloud with children 

![Reading aloud with children](https://help-for-early-years-providers.education.gov.uk/rails/active_storage/blobs/proxy/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBdllCIiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--cb778d801829ffb0349fd722aff28e2dcdc1dd0a/literacy_comprehension_activity1.jpg "Practitioner reading to a child") 

You’ll need books the children enjoy. Choosing books that include words that children and adults would be unlikely to use in speech can be particularly helpful.

Before reading think about:

- what the children already know
- which words they are practising or using for the first time
- if they will recognise the book’s language, for example, story markers, ‘once upon a time’, ‘one day’

Sit in a cosy place with your children and as you read with them:

- ask ‘why have I, you or we chosen this book?’
- tell them why you like it, for example ‘I love this book because the cat always makes me laugh’
- point out colours, pictures and characters
- challenge them to point out the book’s title, or author
- stop and talk about the main characters
- look for rhymes, like ‘shark in the park’

When you are reading it helps to be enthusiastic and exaggerate your movements.

Young children might look at one picture, or just part of a book. Older children could use finger or stick puppets to act out the story, or act it out themselves.

Ask children about some of the main points, for example ‘have you seen one of these animals before?’ Provide related toys or equipment, such as musical instruments, a magnifying glass or toy animal.

Think of similar, new words you could use. For example, when hunting a bear ‘what else does walking through mud sound like?’.

###How the activity links to the other areas of learning

Reading and talking about books, while asking and answering questions about them ([communication and language](/communication-and-language)). Talking to children about what they know ([personal, social and emotional development](/personal-social-and-emotional-development)). Talking about words and rhyme ([exploring words](/literacy/exploring-words)). Looking at pictures, and talking about them ([expressive arts and design](/expressive-arts-and-design)).

###Reading book groups

![Practitioner reading to a group of children](https://help-for-early-years-providers.education.gov.uk/rails/active_storage/blobs/proxy/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBdmNCIiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--c6785ae1b3c148abc543671b124d5cb6c602d0eb/literacy_comprehension_activity2.jpg "Practitioner reading to a group of children")

You’ll need books the children enjoy. Some suggested titles are:

Traditional tales:

- ‘Three little pigs’, original
- ‘Three little wolves’ and the ‘Big bad pig’, by Eugene Triviza and Helen Oxenbury
- ‘Each peach pear plum’, by Janet and Allan Ahlber

Rhyming books:

- ‘Pigeon poo’, by Elizabeth Baguley and Mark Chambers
- ''A is amazing’, edited by Wendy Cooling
- ‘Odd socks’, by Rebecca Ashdown

Books containing letters:

- ‘The Jolly Postman’ or ‘Other peoples’ letters’, by Janet and Allan Ahlberg
- ‘Snail mail’ (with pull-out postcards), by Sharon King- Chan

Wordless books:

- ‘Mirror,’ by Jeannie Baker
- ‘Knock knock’, by Kaori Takahashi

Develop children’s conversation and vocabulary by talking with them as they read.

Arrange book groups attractively in your reading area.

Invite children to share a book together. Ideally, it would link to something the child has done recently, or what they imagined, watched or explored.

Explore the book’s front and back, noticing any pictures or words that might help guess what happens inside.

Talk to children while turning the pages, asking what they think might happen next. Get them to ‘read to you’, or say what they think is happening. It does not matter if they don’t get it exactly, or if parts are missed.

Sensitively point out words or pictures, asking and waiting for feedback. ‘Do you like this story, picture, character?’ ‘Why? Why not?’. Talk about their responses.

###How the activity links to the other areas of learning

The children could explain what they like or dislike and why ([personal, social and emotional development](/personal-social-and-emotional-development)). Children could comment or expand on a story ([communication and language](/communication-and-language)) and holding books and turning pages encourages physical development. When children come across numbers and shapes in context this supports [mathematics](/mathematics). Books are a way of exploring the world beyond their own environment ([understanding the world](/understanding-the-world)). Reading enhances imagination and creativity ([expressive arts and design](/expressive-arts-and-design)).

##Other activities

[Booktrust](https://www.booktrust.org.uk/) has suggested children’s books and book lists, advice and games.

[BBC Nursery songs](https://www.bbc.co.uk/teach/school-radio/nursery-rhymes-songs-index/zhwdgwx) is a bank of songs and nursery rhymes that focus on comprehension.

[The Centre for Literacy in Primary Education](https://clpe.org.uk/teaching-resources) has activities that are suitable for early years.

Resources from [Love my books](http://www.lovemybooks.co.uk/) helping parents and young children enjoy sharing books together.

##What other nurseries and childminders are doing

^“Reading is a huge part of our everyday nursery routine. Allowing children to get engrossed in books, using illustrations and props to enhance how they follow a story, gives children confidence to ‘have a go’. This confidence carries over to many other learning areas, sparking imagination, curiosity and joining in related tasks such as roleplay. All these skills are paramount in supporting early years children’s comprehension. We make our book areas cosy and inviting, offering a range of different book types. Offering this supports each child’s individual learning needs.”^

Emma, Newbury Gardens Day Nursery, West Berkshire.

##Summary

- Reading is a necessary, lifelong skill.
- Being read to provides comfort for children, improving their concentration and focus.
- Being read to gives children knowledge to understand and talk about the world around them. 
- When children understand what is being read this helps them understand how words, phrases and sentences are put together.
- Using and sharing fiction and non-fiction books, poems, rhymes and songs builds children’s understanding and use of language.

##Next steps

- Have a good look through all your books or look at what can be borrowed from local libraries checking which ones work for you.
- Use books that support question development, helping children improve their understanding of what’s happening.
- Make sure your book choices give you lots to talk about and enjoy with your children.
- Choose books for different purposes, for example to extend vocabulary, get an emotional response or broaden their experiences of real or imagined worlds.
- Repeat readings of the same stories with the children.
- Discuss favourite books with your colleagues or other providers. Compare notes, and exchange ideas. Ask which ones they use, and why.

$CTA

**Get alerts for new EYFS resources**

[Sign up to get emails when we add new early years foundation stage resources to this website](https://docs.google.com/forms/d/e/1FAIpQLSdZbPz-447CADTErT9eD1IU4yKfsEhyJy1C8U1fyFAQuEtejw/viewform?usp=sf_link)

$CTA
', '2021-02-23 17:48:29.286377', '2022-09-06 13:29:06.499582', 9, 1, 11, 9, 't', 'Helen Rapp', 'Learn more about reading comprehension as part of the early years foundation stage (EYFS), including advice from experts and suggested activities.', '{:.contents-list__list}
* {:.contents-list__list-item .contents-list__list-item--dashed} [Why reading comprehension is important](#why-reading-comprehension-is-important)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Video](#video)
* {:.contents-list__list-item .contents-list__list-item--dashed}[What the EYFS framework says](#what-the-eyfs-framework-says)
* {:.contents-list__list-item .contents-list__list-item--dashed}[What this means in practice](#what-this-means-in-practice)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Suggested activities](#suggested-activities)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Other activities](#other-activities)
* {:.contents-list__list-item .contents-list__list-item--dashed} [What other nurseries and childminders are doing](#what-other-nurseries-and-childminders-are-doing)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Summary](#summary) 
* {:.contents-list__list-item .contents-list__list-item--dashed} [Next steps](#next-steps)   ', 'Learn more about reading comprehension as part of the early years foundation stage (EYFS), including advice from experts and suggested activities.'),
(11, 'Exploring words', 'exploring-words', '##Why exploring words is important

Stories are an important part of life. Loving printed books and developing an enjoyment of looking at or hearing stories is an integral part of early years practice. Research shows that the amount of input young children receive from the adults around them makes a significant difference to how children learn to read and write in reception classes. This section outlines the knowledge and skills that children need to develop:

- phonological awareness, the awareness of all of the sounds of language, it''s the ability to hear and distinguish sounds
- vocabulary
- expressive language, vocabulary, grammar and changes to words such as plurals (known as morphology)
- receptive language, the ability to understand what is said

Word reading is explicitly taught in Reception classes, and all the early communication experiences parents and early years settings provide helps children to learn to read successfully. 

Enjoyment of books, rhymes and songs helps children to read because you:

- share books on a daily basis
- provide opportunities to use spoken language and take part in talk (verbal interaction)
- read aloud
- discuss books
- extend spoken language by introducing new words in context, drawing attention to letters and sounds
- develop thinking and reasoning
- listen, giving a spoken account of a set of events (narrative) and developing vocabulary skills

Word reading and language comprehension are essential building blocks. Children in the EYFS need word support from an early age, to develop hearing, saying and recognising words or word parts.

##Video

In this video, an early years expert explains the importance of exploring words in the early years foundation stage framework. There are also some tips on how to support children in this area.

$YoutubeVideo[Exploring words](https://www.youtube.com/watch?v=liSVRicSin0)$EndYoutubeVideo

##What the EYFS framework says

It is crucial for children to develop a lifelong love of reading. Reading consists of two dimensions: language comprehension and word reading. 

Skilled word reading, taught later, involves both the speedy working out of the pronunciation of unfamiliar printed words (decoding) and the speedy recognition of familiar printed words. 

[Statutory framework for the early years foundation stage](https://www.gov.uk/government/publications/early-years-foundation-stage-framework--2), page 9.

##What this means in practice

Adults use books all the time. Having lots of books in the setting, reading enthusiastically, and talking to the children about why you love books starts to develop a love of reading. Making sure children have a lifelong enjoyment of books, starts by helping them understand that pleasure, fun and joy are associated with books, stories and rhymes.

You support children’s understanding of words through a range of activities, with enthusiasm and showing an exaggerated love of books. You talk about the children’s focus of interest finding books to support and extend their experiences. You connect new words to meaningful events in the child’s daily life. You explain, pretend, talk about past and what may happen in the future to broaden children’s understanding of word meaning.

Encourage children to notice signs, symbols, notices, numbers, rhymes, books, pictures, songs, and poetry, considering their different interests, understanding levels, home backgrounds and cultures.

Children should hear a wide range of songs, poems and stories, covering a selection of sounds to isolate. This helps them to develop their phonological awareness.

Provide experiences of:

- rhyme
- rhythm
- alliteration, or words that repeat the same sound in a sentence. For this, at snack time you could say ‘Aman, would you like an awesome apple?’ ‘Tam, have you brought a tasty tomato?’ ‘Saskia has some squishy strawberries’

Provide opportunities to ‘hear’ sounds. On walks, point out lorries as they rattle past, or quiet forest sounds and louder street sounds. Talk about these. Children could either hear or make sounds themselves. Focus children’s attention on a rich variety of vocabulary, including rare and infrequent words. When it rains, grab welly boots, coats and umbrellas. Can children hear raindrops ‘pitter pattering’? Take a bubble machine out with you. Children can enjoy dancing and singing under the bubbles. How do bubbles sound when they pop?

When reading with children, let them repeat and emphasise words with expression so they can react to your story. For example, ‘I’ll h-u-ff and I’ll p-u-ff and I’ll blow your house down. Ph-ee-ww (stretched whistle)’ Consider which songs and rhymes you naturally choose. Cover all sounds equally. Fill gaps of any sounds covered less often.

Make sure you get the support and help from the family by asking parents or grandparents to share songs, rhymes and stories from their cultures and childhoods, helping children identify new sounds and widen their vocabulary.

##Suggested activities

###Hide and seek sounds

![A rubber duck](https://help-for-early-years-providers.education.gov.uk/rails/active_storage/blobs/proxy/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBdmdCIiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--9b927d1282852e7ffc97370d890bd96cd24539a9/literacy_wordreading_activity1.jpg "A rubber duck")

You’ll need:

- a bowl or container
- water and water beads (soaked overnight, following manufacturers health and safety guidance), or other materials
- a wide selection of objects, covering various sounds and letters. For example toy animals, insects, vehicles, space characters, dinosaurs and magical creatures like fairies or unicorns

Prepare the water beads the day before with the children, sparking their curiosity. ‘I wonder what will happen?’. The next day, hide the objects in the beads or your chosen material. Prepare songs or rhymes for when the children “go fishing”.

Let children play with the beads. Emphasise words for colour and texture like squelchy or squishy. Watch as beads flip, slide and pop. Consider using flashcards to show these words.

When children find things emphasise how words sound, or read. For example if they:

find a duck, sing ‘five little ducks’, **duck** and **quack**
find a rabbit, sing ‘sleeping bunnies’, **rabbit** and **hop**
find a motorbike, make a loud **revving engine** sound
find a bus, sing ‘wheels on the bus’


Change song parts to include children’s names and actions like jumping, pointing to facial features, or a particular letter or sound.

For younger children, only play with the beads and try object-finding later. Chat together and sing rhymes about colours, rainbows, textures. 

To challenge older children, try wordplay. They could say or read words from prompt cards with an identical last sound, for example, after finding a frog try fig, pig, wig, big.

To change this activity, hide items in sand, flour, snow (real or artificial), ice or around your setting. Use it in line with your chosen wider themes, for example seasons, hiding a sun model. Or gardening, hiding some flowers or vegetables.

###How this activity links to other areas of learning

This encourages children to talk [(communication and language)](/communication-and-language). It develops children’s ability to hold tools [(physical development)](/physical-development). It extends children’s experiences [(understanding the world)](/understanding-the-world) and their ability to talk and understand the world around them [(reading comprehension)](/literacy/reading-comprehension).

###Volcano

![A paper mache volcano](https://help-for-early-years-providers.education.gov.uk/rails/active_storage/blobs/proxy/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBdmtCIiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--0319f6f2da731951602fb6136b8c1e70dfeba61b/literacy_wordreading_activity2.jpg "A paper mache volcano")

You’ll need a book to read. For example, here we use ‘Going to the Volcano’ by Andy Stanton and Miguel Ordonez, which supports harder letter sounds like ‘v’ and ‘z’.

In the story, two children visit a volcano. The book repeats sentences with a rhythm and beat. Words also play with ‘o’, for example ‘volcano, jane-o, lane-o, dane-o, train-o, plane-o’. The pictures are simple, with hidden clues, like:

- lava bears have letters on their chests, spelling out ‘volcano’
- there is a colour-changing cat to find on each page
- space characters are called Zib, Zob, Zub, Zab and Zoob

It’s easy to match story parts with setting toys like dinosaurs, a crane, a train, a plane, the weather and nurses and doctors named after the volcano.

Read the book, looking at pictures while playing with any repetitive words. Consider building on the story with roleplay, for example:

- pack a rucksack, what will you bring? Do you need a list?
- bring toys and characters along. Roleplay train journeys, plane journeys. For older children, notice sounds and spellings
- look at the animals, dog, cat, panda, rabbit and bird. What words rhyme with them? What letter do they begin with?
- there is a band in the book, what songs do they sing? What songs do you know? Be the band, with instruments. Or be an instrument. Play a pretend trumpet or trombone, or bang on a drum saucepan
- build a volcano. What does the explosion sound like? What about smells? Your volcano model can be any size, depending on you and your space.

For a volcano model, you’ll need:

- a small bowl
- a cup
- 1 tbsp bicarbonate of soda (baking soda)
- 1 tbsp washing up liquid
- 2 tbsp water
- ½ cup vinegar
- 1 tbsp red food colouring

In a bowl, combine bicarbonate of soda and washing up liquid. Add water and mix thoroughly, then pour mixture into your volcano.

In a cup, mix together vinegar and food colouring.When ready, pour the vinegar into the bicarbonate bottle. 

Wait for it to erupt, watching the lava flow.

This short National History Museum video shows [how to make a volcano](https://www.nhm.ac.uk/discover/how-to-make-a-volcano.html).

###How this activity links to other areas of learning

Children imagine how they would feel on a journey to a specific place [(imagination and creativity)](/expressive-arts-and-design/imagination-and-creativity). They’re able to see how a volcano works [(spatial reasoning)](/mathematics/spatial-reasoning) and respond to it (exploration of materials). They’ll want to talk about what they saw [(communication and language)](/communication-and-language).

##Other activities

[Let’s get moving with action words.](https://www.youtube.com/watch?v=dyJXuIJ-x9A)

[A good selection of babies and children''s nursery rhymes from the BBC.](https://www.bbc.co.uk/tiny-happy-people/nursery-rhymes-and-songs-collection) 

[ICAN have simple indoor word reading activities for children.](https://ican.org.uk/a-message-to-our-supporters-on-coronavirus/activities-to-develop-speaking-and-listening-skills/home-based-activities-for-toddlers-and-young-children/)

##What other nurseries and childminders are doing

^“On our walks, we use stories and rhymes to engage children. Recently we walked through the woods, coming to a hill. The 3 year old children climbed it first, followed by the 20 month old who needed some help. We sang ‘The Grand Old Duke of York’ as we climbed, and the younger child joined in saying ‘up, up.’ The big ones ran down saying ‘down again’. We stopped halfway, finishing the song ‘neither up nor down’. Another time we used Jack and Jill. I changed the song names to children’s names, making it personal to them. I got muddled because the song didn’t rhyme, but the children found it funny.”^

Caroline, childminder, Rotherwick.

##Summary

- Sound knowledge starts at birth. Support children to recognise and produce sounds in words. Help them to learn the meaning of new words through the activities they do with you, help children to notice how the word appears, (representation), and learn how to use words correctly. 
- How are you linking spoken language to developing reading and writing? For example, focus children’s attention on labels on objects that interest them, talk to children using a variety of words that have similar meanings. 
- Provide opportunities for children to express their ideas verbally and explore a rich vocabulary through high quality books.
- Children with better language skills will develop stronger reading skills.


##Next steps

- Consider talking opportunities for your children. Are you playing with words and making up your own? Are you extending their sound knowledge?
- Check for sounds that children struggle with. Some sounds and letters are more difficult. Once you have identified these, give them attention. Seek out opportunities to play with them more often.
- Proving children with lots of opportunities to understand and hear sounds building helps them in the reception year develop their formal phonic journey.

$CTA

**Get alerts for new EYFS resources**

[Sign up to get emails when we add new early years foundation stage resources to this website](https://docs.google.com/forms/d/e/1FAIpQLSdZbPz-447CADTErT9eD1IU4yKfsEhyJy1C8U1fyFAQuEtejw/viewform?usp=sf_link)

$CTA', '2021-02-23 17:48:29.301012', '2022-09-06 13:29:29.812943', 9, 2, 12, 10, 't', 'Helen Rapp', 'Learn more about exploring words as part of the early years foundation stage (EYFS), including advice from experts and suggested activities.', '{:.contents-list__list}
* {:.contents-list__list-item .contents-list__list-item--dashed} [Why exploring words is important](#why-exploring-words-is-important)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Video](#video)
* {:.contents-list__list-item .contents-list__list-item--dashed}[What the EYFS framework says](#what-the-eyfs-framework-says)
* {:.contents-list__list-item .contents-list__list-item--dashed}[What this means in practice](#what-this-means-in-practice)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Suggested activities](#suggested-activities)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Other activities](#other-activities)
* {:.contents-list__list-item .contents-list__list-item--dashed} [What other nurseries and childminders are doing](#what-other-nurseries-and-childminders-are-doing)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Summary](#summary) 
* {:.contents-list__list-item .contents-list__list-item--dashed} [Next steps](#next-steps)   ', 'Learn more about exploring words as part of the early years foundation stage (EYFS), including advice from experts and suggested activities.'),
(12, 'Writing', 'writing', '##Why writing is important

Writing is an important lifelong skill. Children need to learn to write so they can communicate and express themselves. 

Formal writing, taught later in reception, involves transcription (spelling and handwriting) and composition (articulating ideas and structuring them in speech, before writing).

Formal writing before reception is not necessary, however, you can provide lots of meaningful opportunities for children to learn about the written word and to support them to understand that symbols carry meaning.

Research shows that for writing to develop, you should provide young children with opportunities to build their physical strength and control in the core, upper body, hands and fingers. 

Writing develops alongside all learning areas, especially [communication and language](/communication-and-language), [reading](/literacy/exploring-words) and [mathematics](/mathematics).

When you read texts, you show that print carries meaning. When you write, you explain what decisions you are making in your mind, so children understand how they share thoughts, ideas and feelings. As you model writing you support children to: 

- understand language patterns 
- develop their thinking skills
- solve problems
- make sense of their experiences

Listening to children talking and modelling how to write down the words they say helps children to see how sounds become words on paper.

Sharing children’s early mark-making attempts with parents and carers builds children’s confidence and self-esteem.

##Video

An early years expert explains how to prepare children for writing in the early years foundation stage framework (EYFS). There are also some tips on how to support children in this area.

$YoutubeVideo[Writing](https://www.youtube.com/watch?v=qKWuwetagjM)$EndYoutubeVideo

##What the EYFS framework says

Writing involves transcription (spelling and handwriting) and composition (articulating ideas and structuring them in speech, before writing).

[Statutory framework for the early years foundation stage](https://www.gov.uk/government/publications/early-years-foundation-stage-framework--2), page 8.

##What this means in practice

Children learn that you can communicate through writing, and that marks have meaning, by watching you write. You could write labels in front of them, while you explain, the direction of print, or what the word is. Use these labels for everyday objects the children are interested in. For example, cars, pram or bike park.

To support transcription, give children opportunities to develop finger strength. In the early stages children need lots of fun, play activities. Provide lots of activities to work at a large scale using brushes on walls outside, before they move on to using  chunky crayons or pencils. For example, to develop finger strength in preparation for writing, show them activities like manipulating dough, completing puzzles or threading blocks onto a rope.

Help children develop fine motor skills to grasp, hold, and strengthen fingers and thumbs by scrunching paper and using pick-up tools. For example, use big tweezers to pick up plastic shapes.

Give them opportunities to develop core strength and ‘muscle isolation’, a crucial first step towards writing. Activities like reaching across the body to put on socks and shoes help children to use their right, or left, body side without the other side moving at the same time. Also, encourage activities like climbing, throwing and catching.

Children move through stages in their mark making. Gradually muscle control becomes more defined until they develop an ability to use straight lines and curves to form symbols. 

Generally, 0 to 2 year olds enjoy sensory activities, establishing fun and fascination with shapes, marks, letters and numbers. For example, hide letters and shapes in foamy water. Share books, repeating words, phrases and rhymes. Play finger games like ‘Incy Wincy Spider’. Concentrate on activities that could lead to writing, like making marks with large toys, or with fingers in wet sand.

Generally, 2 to 3 year olds like retelling favourite stories and events. Capture these through drawing lines, dots and circles. Promote physical development, communication and understanding. If children use a particular dominant hand, encourage them. This age group should learn ‘mark-making’.

Generally, 3 to 4 year olds start behaving like writers, making wavy lines and distinct separate marks. If children show an interest and want to write, it is crucial that they should develop hand and finger strength to hold a chunky crayon or pencil comfortably and with control. Eventually they may be able to make attempts to write some very familiar letters, for example from their name. 

Preschool children are not expected to achieve conventional spelling patterns, it is the attempt that counts, and the realisation that marks have meaning. 

If children show an interest in writing letters, you can support them to be ready for the next stage of their learning by encouraging them to hold a pencil correctly and form the letter starting in the right place and moving in the right direction. This will support them to develop good habits for the future.

Support children’s composition by reading stories, talking to children, re-phrasing what they have said and modelling correct sentence structure. This will support children to share their ideas and help them to develop an understanding of how sentences are formed. Activities, like those in the [communication and language](/communication-and-language) sections and within the [exploring words](/literacy/reading-comprehension) section, can help to extend a child’s vocabulary and give them words to as they begin to form sentences.

You provide many opportunities for children to capture their thinking and structure it for a range of purposes and audiences (composition). For example, record names of characters in their favourite picture books; make invitations to members of their family for parties, shows or local events. Role play about everyday experiences provide opportunities to write, for example, an office using a keyboard, answering a phone and making notes for Mummy or Daddy. If they go to the shops they may ‘write’ shopping lists for what they need to buy.

##Suggested activities

###Recipes for dragon soup

![A mud kitchen](https://help-for-early-years-providers.education.gov.uk/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBdm9CIiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--47ff5d65053a8688bbab7f3624570aa22bf5d62a/literacy_writing_activity1.jpg)

You’ll need:

- a ‘mud kitchen’, or outdoor area with old pots and pans, kitchen utensils and stirring sticks. If you do not have a suitable outdoor area, you could do this inside on top of newspaper, an old carpet or sheet
- chefs outfits like hats, aprons or anything children might enjoy dressing up in
- potion bottles, pestle and mortar
- clipboards, marker pens or felt tips
- vegetables, these can be wooden, plastic, playdough or real
- herbs, to smell and talk about
- flower petals, if available
- containers, dishes, bowls, colanders

If you cannot do muddy play, provide other materials like a baking tray with a thin layer of sand, salt, glitter, or sieved flour. Children could make marks with the back of a fork or spoon, a paintbrush, finger or stick.

Ask children to be ‘chef’, making new dragon soup recipes.

Talk about ingredients, how to prepare and sort them. Do we cut them? How many do we need? Make lists together using letters, words or shapes. Either write them yourself with the children watching, or the children could make marks.

Children can pick up ingredients using utensils, stirring, scooping or pouring from one pan to another. Poke the mixture through a colander’s holes, building finger strength.

Children can record or write their used ingredients using the clipboard, paper and tools. Younger children may talk about what they do, as a running commentary. Older children may attempt to write words or letters, showing used ingredients, for example, ‘c’ for carrot, ‘o’ for onion.

###How this activity links to the other areas of learning

Children gain real life experience choosing ingredients and taking a shopping list to the shops ([understanding the world](/understanding-the-world)). They use gross and fine motor skills to stir, poke and write ([physical development](/physical-development)). They talk about their recipes, noticing smells and actions ([communication and language](/communication-and-language)). They read about other recipes and dragon stories ([reading comprehension](/literacy/reading-comprehension)).

###Little Red Riding Hood

![Little red riding hood](https://help-for-early-years-providers.education.gov.uk/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBdnNCIiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--63c779089f7d9308829635d8678941a2ad320efb/literacy_writing_activity2.jpg)

You’ll need:

- a copy of Little Red Riding Hood, there are many versions, so children can understand different character viewpoints. In some versions, Little Red Riding Hood is a boy or girl. Anyone can be the character
- dressing up clothes, a piece of red cloth, a headband with ears, a tail, a basket with shopping items
- a large piece of paper taped under the table, a selection of small paper sheets, envelopes, postcards, various crayons, paints and pencils
- miniature characters, trees and animals
- sensory materials, like playdough or fabrics

Tell or read your copy of Little Red Riding Hood. Talk about characters, while exploring and sharing thoughts, ideas and feelings using the storyline.

Help children write an invitation to Little Red Riding Hood visiting Grandma’s house, addressing an envelope.

What do they need to take? Make a list, a map, food and water, a basket.

Draw a map on the large paper. Draw pictures on it, and label them. Help the children write instructions, so Little Red Riding Hood can find the way.

Roleplay, listening to and developing children’s ideas. Find opportunities for as many mark-making or writing attempts for older children as possible.

Adapt based on the children’s ages. Some will be able to make some marks, while older ones might write down character’s names, or shopping lists.

###How this activity links to the other areas of learning

Mark-making will develop gross and fine motor skills ([physical development](/physical-development)). Roleplay will mean acting out the stories ([imagination and creativity](/expressive-arts-and-design/imagination-and-creativity)), while listening to them ([reading comprehension](/literacy/reading-comprehension)). While listening, children will seek out rhyming words and sounds ([exploring words](/literacy/exploring-words)).

##Other activities

[Learning to write activities, short video.](https://youtu.be/tKwruceavN0)

[Developing fine motor skills in preparation for writing, First Discoverers.](https://www.firstdiscoverers.co.uk/early-years-development-fine-motor-skills/)

##What other nurseries and childminders are doing

“Writing is a form of communication. We encourage children to look at print around preschool, and on our listening walks. There are opportunities in all areas to write using different mark-makers. As fine and gross motor skills are essential for a child to be ready to write, we make sure children develop hand muscles though small, loose-part play. Roleplay creates confidence, helping children get ready for school.”

Angela, Hatch Warren Preschool, Basingstoke.

##Summary

- Writing is a lifelong skill, allowing children to share thoughts, ideas and feelings.
- Children need hand-eye coordination and finger strength before learning to write.
- Younger children should learn basic mark-making and older children to make plausible attempts at capturing some sounds they hear in words.
- Writing builds on children’s understanding of language and how print works. 
- You should model writing and explain your thinking and decision making to help children understand what happens as you write and can begin to copy you.

##Next steps

- Think about the opportunities you give children to develop muscle strength.
- Motivate children to make plausible attempts to behave like a writer, and to draw freely making marks that have meaning.
- Provide a wide range of opportunities, such as, wet sand, corn flour, foam, chunky markers, clipboards, chalks for paving stones, and notepads.
- Plan small muscle coordination for hands and fingers, through things like using scissors, learning to sew, eating with cutlery, using small painting brushes or drawing pencils and crayons.

$CTA

**Get alerts for new EYFS resources**

[Sign up to get emails when we add new early years foundation stage resources to this website](https://docs.google.com/forms/d/e/1FAIpQLSdZbPz-447CADTErT9eD1IU4yKfsEhyJy1C8U1fyFAQuEtejw/viewform?usp=sf_link)

$CTA
', '2021-02-23 17:48:29.314559', '2023-01-18 16:15:24.994253', 9, 3, 13, 11, 't', 'Jenny Pendriss', 'Learn more about writing as part of the early years foundation stage (EYFS), including advice from experts and suggested activities. ', '{:.contents-list__list}
* {:.contents-list__list-item .contents-list__list-item--dashed} [Why writing is important](#why-writing-is-important)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Video](#video)
* {:.contents-list__list-item .contents-list__list-item--dashed}[What the EYFS framework says](#what-the-eyfs-framework-says)
* {:.contents-list__list-item .contents-list__list-item--dashed}[What this means in practice](#what-this-means-in-practice)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Suggested activities](#suggested-activities)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Other activities](#other-activities)
* {:.contents-list__list-item .contents-list__list-item--dashed} [What other nurseries and childminders are doing](#what-other-nurseries-and-childminders-are-doing)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Summary](#summary) 
* {:.contents-list__list-item .contents-list__list-item--dashed} [Next steps](#next-steps)   ', 'Learn more about writing as part of the early years foundation stage (EYFS), including advice from experts and suggested activities. This section outlines the knowledge and skills that children need before moving onto formal writing.'),
(13, 'Mathematics', 'mathematics', 'Access resources, activity ideas and advice for teaching early years maths.

## Early years maths resources

Resources are split into 3 areas based on the educational programmes: 

[Numbers](/mathematics/numbers)

[Patterns and connections](/mathematics/patterns-and-connections)

[Spatial reasoning](/mathematics/spatial-reasoning)

These resources will help you when reviewing your current curriculum to make sure you are meeting the requirement of the revised mathematics area of learning.  

As you make changes to your curriculum consider what you want children to learn first and plan opportunities for them to achieve this.

## What the EYFS framework says about maths

Developing a strong grounding in number is essential so that all children develop the necessary building blocks to excel mathematically.

<details class="govuk-details">
<summary class="govuk-details__summary">
<span class="govuk-details__summary-text">
Read more
</span>
</summary>
<div class="govuk-details__text">

<p>Children should be able to count confidently, develop a deep understanding of the numbers to 10, the relationships between them and the patterns within those numbers.</p>

<p>By providing frequent and varied opportunities to build and apply this understanding - such as using manipulatives, including small pebbles and tens frames for organising counting - children will develop a secure base of knowledge and vocabulary from which mastery of mathematics is built.</p>

<p>In addition, it is important that the curriculum includes rich opportunities for children to develop their spatial reasoning skills across all areas of mathematics including shape, space and measures.</p>

<p>It is important that children develop positive attitudes and interests in mathematics, look for patterns and relationships, spot connections, ‘have a go’, talk to adults and peers about what they notice and not be afraid to make mistakes.</p>

</div>
</details>

$CTA

**Get alerts for new EYFS resources**

[Sign up to get emails when we add new early years foundation stage resources to this website](https://docs.google.com/forms/d/e/1FAIpQLSdZbPz-447CADTErT9eD1IU4yKfsEhyJy1C8U1fyFAQuEtejw/viewform?usp=sf_link)

$CTA', '2021-02-23 17:48:29.33294', '2021-12-17 15:27:11.531123', NULL, 5, 15, 12, 't', 'Helen Rapp', '', '', ''),
(14, 'Patterns and connections', 'patterns-and-connections', '##Why patterns and connections are important

Patterns are central to maths and children have an instinctive idea of patterns. 

Research shows that children’s ability to see patterns forms the basis of early mathematical thinking. When you teach children to become aware of patterns, they will build up the skill of spotting patterns for themselves, they will see how patterns change and notice irregularities.

Pattern awareness can vary significantly between children. Early patterning begins with matching one-to-one with objects, pictures or numbers.

From birth to 3 years old you should provide patterned material and small objects to arrange in patterns. 

For 3 and 4 year olds you should be introducing more pattern recognition. Talk to children about, and identify the patterns around them, so they can learn the words that describe different patterns. 

As children become more confident in making patterns and seeing connections, they will be able talk out loud about what they have noticed. 

Children will start to identify the mathematical relationships and connections around them in the home, your setting and outside in nature. 

Patterning supports the foundations for recall of the counting sequence and understanding number operations.

Learning about patterns and connections will help children to make their own predictions and form logical connections. It’s an important foundation for later mathematical thinking and reasoning.

##Video

In this video, an early years expert explains the importance of patterns and connections in the early years foundation stage framework. There are also some tips on how to support children in this area.

$YoutubeVideo[OPTIONAL TITLE](https://www.youtube.com/watch?v=fsWEHuDpE8g&list=PL7914115EB65911A5&index=9)$EndYoutubeVideo

##What the EYFS framework says

It is important that children develop positive attitudes and interests in mathematics, look for patterns and relationships, spot connections, ‘have a go’, talk to adults and peers about what they notice and not be afraid to make mistakes. 

[Statutory framework for the early years foundation stage (EYFS)](https://www.gov.uk/government/publications/early-years-foundation-stage-framework--2), page 10.

##What this means in practice

Support children to notice mathematical features and observe regularities when they are playing or taking part in activities.
 
From birth to 3 years old, rhymes and stories have an important place in their understanding of patterns. By practising recall such as ‘head, shoulders, knees and toes’ and repeated refrains within stories children learn about patterns in speech and language. 

To learn about visual patterns show them patterned material like gingham, polka dots, stripes. Show them how to arrange small objects in patterns. Use words like ‘repeated’ and ‘the same’ over and over.
For 3 and 4 years old, talk about and identify the patterns around them. For example: stripes on clothes, designs on rugs and wallpaper. Use words like ‘pointy’, ‘spotty’, ‘stripy’. You could provide interesting patterns from different cultures, like fabrics.

Provide a range of natural and everyday objects and materials, as well as blocks and shapes, for children to play with freely and to make their own patterns with. 

You could support children to begin to make a simple AB, AB, AB pattern. Children can then begin to notice numerical patterns of 1,2,1,2. You could help children to notice and correct an error in a repeating pattern. Discuss any error in a positive manner, asking if you can check together, work out together what comes next. 

Some children will create regular patterns with ease and others will make random or irregular patterns. It is important that children are free to invent their own patterns, this will help them develop reasoning skills. 

Patterns also exist in music and rhymes and you could engage children in inventing their own movement and music patterns. For example you could help them invent rhythms like ‘clap, clap, stamp’.

As part of daily life children need to experience how the routines of the day follow patterns. Explain to them the patterns of events that happen every day such as lunch time or getting dressed to go home. For example, ‘every day we…’. Use appropriate words like ‘morning’, ‘afternoon’, ‘evening’.

Sequences are also a kind of pattern. Begin to describe a sequence of events, real or fictional, using words like ‘first’ and ‘then’. Stories are a good way of introducing sequences.

Show them how to count down to events on the calendar in terms of the number of days or number of sleeps. Use words like ‘yesterday’ and ‘tomorrow’. 

##Suggested activities

###Exploring pattern outside using natural resources

![Pine cones, leaves, conkers and pebbles](https://help-for-early-years-providers.education.gov.uk/rails/active_storage/blobs/proxy/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBdkVCIiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--e18b956617b004da6a7325e19d77db64c77a0740/maths_patterns_activity1.jpg "Pine cones, leaves, conkers and pebbles")

You’ll need:

- an area that will be suitable to arrange a selection of natural or loose parts. Check all of the resources are suitable and safe to use such as empty containers, baskets, boxes, buckets and tubes ranging in shape and size
- natural items like leaves, petals, conkers, fir cones, shells, pebbles, sticks, feathers and acorns
- chalk to draw on the ground
- patterns in your immediate outside area like bricks in a wall, lines on pavements, petals on flowers, veins on leaves or fencing

Allow the children the freedom to explore the resources. Provide a range of containers so they can sort resources into different sets.

Point out the patterns in the items. For example, leaves and petals have interesting repeated pattern shapes. So do fir cones, shells or trees. Children under 2 could examine a leaf or a petal.


You could provide a commentary using language to describe the shapes of what things the children are looking at, such as circular, square, dots or stripes. 

It may help to provide chalked boxes for children to make their own collections with natural objects arranged in various ways. 


###How this activity links to the other areas of learning

Children are given the opportunity to be creative, design their own patterns [(expressive arts and design)](/expressive-arts-and-design). They’ll learn about the natural world [(understanding of the world)](/understanding-the-world). They’ll discuss and express their understanding of patterns [(communication and language)](/communication-and-language). By spotting patterns they’ll begin to identify different mathematical relationships [(mathematics)](/mathematics).

###Playing skittles

![Set of skittles set up outside](https://help-for-early-years-providers.education.gov.uk/rails/active_storage/blobs/proxy/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBdjRCIiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--c6edd12f26fb13a982946a103505cf2bd13ba83c/maths_patterns_activity2.jpg "Set of skittles set up outside")

You’ll need:

- skittles, either bought or home-made
- balls in different sizes and weights
- paper and pen
- small whiteboard and pen 
- chalk and chalkboard

Choose an area that has a flat surface, inside or outside, and mark out the game area. 

Set up a recording station to collate scores, like a blackboard, and discuss the rules with the children. Show them how to set up the skittles. Show them where to stand. Explain to them how to count scores, take turns and how to record the scores.

Show the children how to roll the ball and discuss how to count the skittles when they have been knocked over. Talk with the children about how they could record their scores and discuss how turn-taking works.

Set up the skittles ready for play and have a practice run first.

###How this activity links to the other areas of learning

Children will discuss, negotiate and express their understanding of the rules of the game [(communication and language)](/communication-and-language). Children can learn physical coordination by playing the game [(physical development)](/physical-development). The activity strengthens all the maths areas [(mathematics)](/mathematics).

##Other activities

Help children with finding and [learning more about patterns](https://nrich.maths.org/13371) on the Nrich site.

[CBeebies Numberblocks](https://www.bbc.co.uk/cbeebies/grownups/help-your-child-with-maths) have some useful activities for young children that encourage the use of patterns and connections.

##What other nurseries and childminders are doing

^“When noticing and identifying patterns we talk about shapes, colours and numbers to start to make connections. We look at which shapes fit within one another. When setting up our environment we carefully select images, photographs and factual books for children to access to support their learning of natural patterns and architecture in our local community and beyond. The rhythm of the day plays a significant part in patterns and this can be used to help children make sense of their day. Patterns come in a variety of forms and can allow children the chance to explore, experiment and discover the world around them. The children always have access to materials such as building blocks (of different sizes), train tracks, construction resources and smaller parts (mosaic tiles). Using these materials, we play alongside the children and help them in identifying the patterns and connections that surround them.”^

Kerry, Redcliffe Nursery School, Bristol.

##Summary

- Introduce children to visual patterns in fabrics and materials and show them patterns in the natural environment.
- Use stories, rhymes and songs to help them understand how patterns and sequences occur in speech and music.
- Use the routines and sequences of the day to show them how patterns are repeated in time.
- Use appropriate language to support children’s understanding of patterns and connections. 
- Understanding repeated patterns and connections is an important foundation for learning maths in reception.

##Next steps

- If possible take opportunities to visit other settings where maths is a strength, this will benefit you and the children. 

- Think about introducing more resources like interesting found materials showing patterns.

- Taking the children on nature walks is a good way to show them patterns in the natural environment.

- Review your curriculum to ensure you cover the requirements in the EYFS for this area of learning.

$CTA

**Get alerts for new EYFS resources**

[Sign up to get emails when we add new early years foundation stage resources to this website](https://docs.google.com/forms/d/e/1FAIpQLSdZbPz-447CADTErT9eD1IU4yKfsEhyJy1C8U1fyFAQuEtejw/viewform?usp=sf_link)

$CTA', '2021-02-23 17:48:29.343581', '2022-09-06 13:30:06.061668', 13, 2, 16, 15, 't', 'Helen Rapp', 'Learn more about patterns and connections as part of the early years foundation stage (EYFS) including advice from experts and suggested activities.', '{:.contents-list__list}
* {:.contents-list__list-item .contents-list__list-item--dashed} [Why patterns and connections are important](#why-patterns-and-connections-are-important)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Video](#video)
* {:.contents-list__list-item .contents-list__list-item--dashed}[What the EYFS framework says](#what-the-eyfs-framework-says)
* {:.contents-list__list-item .contents-list__list-item--dashed}[What this means in practice](#what-this-means-in-practice)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Suggested activities](#suggested-activities)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Other activities](#other-activities)
* {:.contents-list__list-item .contents-list__list-item--dashed} [What other nurseries and childminders are doing](#what-other-nurseries-and-childminders-are-doing)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Summary](#summary) 
* {:.contents-list__list-item .contents-list__list-item--dashed} [Next steps](#next-steps)   ', 'Learn more about patterns and connections as part of the early years foundation stage (EYFS), including advice from experts and suggested activities.'),
(15, 'Numbers', 'numbers', '##Why numbers are important

Children need to develop a positive attitude to maths and not be afraid to make a mistake. 

Children need your help to explore, experiment and discover. Repeating maths activities will develop their understanding of mathematical concepts. Children will begin to understand regular daily routines, like snack time and going-home time, and how to use numbers to describe things. 

Encourage children to use numbers ‘in context’, using numbers in practice, not just in theory. This deepens their understanding. Children can then apply their knowledge and experiment. They can test their new understanding of maths by using numbers in context through the day in real-life situations.

Research shows toddlers engage spontaneously with maths during nearly half the time available for free play. 

Children will develop their own working theories by using numbers in everyday contexts. They will learn to communicate these to others and over time remember mathematical concepts.  

Maths is used for counting and quantities, but children need to develop the other ways numbers are used. For example, for measurements, putting things in order and understanding values.

Look for meaningful maths opportunities to aid learning and progress over time. You should try to find the maths content in all the other areas of learning, if possible.

##Video

In this video, an early years expert explains the importance of numbers in the early years foundation stage framework. There are also some tips on how to support children in this area.

$YoutubeVideo[OPTIONAL TITLE](https://www.youtube.com/watch?v=xfyX4pm-QeA)$EndYoutubeVideo

##What the EYFS framework says

Developing a strong grounding in number is essential so that all children develop the necessary building blocks to excel mathematically. 

Children should be able to count confidently, develop a deep understanding of the numbers to 10, the relationships between them and the patterns within those numbers. 

By providing frequent and varied opportunities to build and apply this understanding - such as using manipulatives, including small pebbles and tens frames for organising counting - children will develop a secure base of knowledge and vocabulary from which mastery of mathematics is built. 

[Statutory framework for the early years foundation stage](https://www.gov.uk/government/publications/early-years-foundation-stage-framework--2). Page 10

##What this means in practice

You should make the most of the opportunities for maths in all that the children do. This means taking advantage of opportunities to use numbers where they naturally arise. Numbers can be found in most situations: indoors, outdoors and in the community, like on bus stops or street numbers. 

Encourage children to use numbers in many contexts. You could show the children the clock, ‘it’s lunch time’, talk about sizes for outdoor clothing ‘what size wellies?’, processes and routines ‘it will be going home time soon’.

You can help younger children from birth to 3 years old start to learn about numbers in several ways.

- Play finger rhymes that use numbers like ‘Round and round the garden’ or ‘Two little dicky birds’.
- Draw attention to changes in amounts, for example, by adding more bricks to a tower. Use words like ‘lots’ or ‘more’.
- Develop counting-like behaviour, children under 2 could be making sounds, pointing or saying some numbers in sequence. Suggestions: count fingers and toes, stairs, toys, food items.
- If children are saying one number word for each object, it is not always necessary to correct them if they skip a number.
- Help children to count numbers using objects. For example, move a piece of apple to one side once they have counted it.
- Help them use ‘manipulatives’ for example, foam dice or counting blocks. 

At 3 and 4 years you can help children expand their mathematical skills in these ways. Children should be learning to:

- Develop fast recognition of up to 3 objects, without having to count them individually, for example, point to small groups of 2 or 3 objects and say ‘look, there are 2’.
- Count things and then repeat the last number. For example: ‘1, 2, 3… 3 cars’.
- Link numerals and amounts, for example, showing the right number of objects to match the numeral, up to 5. Suggestions, have a pot labelled ‘5 pencils’ or a crate for ‘3 trucks’.
- Solve real-world mathematical problems with numbers up to 5. Discuss mathematical ideas throughout the day. Support children to solve problems using fingers, objects and marks, for example, ‘there are four of you, but there aren’t enough chairs, what shall we do?

Closely observe what children are doing during play and make the links to numbers in context during the day.

##Suggested activities

###Setting up a shop

![A toy till and groceries](https://help-for-early-years-providers.education.gov.uk/rails/active_storage/blobs/proxy/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBdjBCIiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--be1cdb46d6ce5032f3b2c9eefc89bdce2fad90c7/maths_numbersincontext_activity1.jpg "A toy till and groceries")

You’ll need:

- a suitable, safe area for the shop, inside or outside
- empty cardboard food boxes and containers
- empty plastic bottles
- fruit and vegetables
- tinned food
- play money, purses, old credit cards
- shopping trolleys, shopping bags, shopping baskets, containers, egg boxes
- toy, homemade, or real cash register, calculator, weighing scales with weights and digital scales
- labels for children to write price tags
- paper and pencils to write shopping lists , images, words and numbers
- pretend vehicle for delivery driver

To carry out the activity:

- talk to the children about what they think could be in the shop, the roles that are needed
- work with the children to set up shelves and containers to store items
- make signage for the shop – labelling on shelves
- make a conveyor belt using a table with paper or plastic that wraps around the table to form a loop.  Seal the paper.  This can then be used to slide the items along to the cashier
- use price labels on the items for sale
- set up an area where children can weigh items and another area to pay for their purchases
- place money into the cash registers and the purses for children to use in their play
- have scanners for credit cards
- negotiate the shop rules with the children
- support the play with rich mathematical language

###How this activity links to the other areas of learning

Children can have real life experiences about shopping ([understanding the world](/understanding-the-world)). Children can try out different roles in the pretend shop - cashier, stacking shelves, customer, personal shoppers for delivery ([personal, social and emotional development](/personal-social-and-emotional-development)). They can use money and work out prices, consider how many items they need, estimate and negotiate how many items fit on shelves, into bags and containers ([mathematics](/mathematics)). They can talk to each other in role and take turns and use shop rules, as well as a discussion about the activity afterwards ([communication and language](/communication-and-language)).  There are many opportunities when setting up a shop for example hairdressers, shoe shop.

###Setting up a welly boot station outdoors

![Two pairs of children''s wellies](https://help-for-early-years-providers.education.gov.uk/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBdndCIiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--4bb578b9662e91ddf3700e0a379908a57704bf44/maths_numbers_activity2.jpg)

You’ll need:

- pairs of wellies in different sizes, both children’s and adults’
- numbers on the soles of the wellies or written on the inside of the boots where children can see the number (size) clearly
- foot measures with length and width measure
- tape measures, rulers of different sizes
- storage for the welly boots
- somewhere for children to sit to put the wellies on
- materials that the children can use to make marks: pens, pencils, chalks, paper, white boards, squared paper, black boards

To carry out the activity:

- set up an area that is accessible and will be suitable for children to change into welly boots
- let the children select and try to put the welly boots on independently
- offer support where necessary
- do not rush the activity, decisions involved in selecting footwear can be complex and children will problem solve
- discuss with the children the size, shape, colour and patterns on the boots and the size of their feet
- support children to measure their feet using foot measures
- support children to select the correct size welly boots by looking for the size on the boots, using their shoes or feet against a welly boot to estimate
- encourage them to look at their own footwear to see if they can find the size of their feet
- give children opportunities to record their mathematical thinking by making marks or pictures, ask the children to talk about what they have done
- extend the activity depending on the direction that the children are taking, consider if they are they making collections, making comparisons, ordering, estimating


###How this activity links to the other areas of learning

Children can talk to you and each other about why they need welly boots and wearing them outside [(understanding the world)](/understanding-the-world). They can work together putting the boots on and off [(personal social and emotional development)](/personal-social-and-emotional-development). They can learn how to get them on and off [(physical development)](/physical-development). Children can write down who needs which size [(listening and understanding)](/communication-and-language/listening-and-understanding). Playing outside with boots on they can make patterns with paint on the bottom [(expressive arts and design)](/expressive-arts-and-design).

##Other activities

Nrich offers a variety of [counting games and activities](https://nrich.maths.org/13372) for pre-school children like ‘Pirate poundland’ and ‘number talks’.

BBC’s CBeebies has [pre-school maths activities and games](https://www.bbc.co.uk/cbeebies/grownups/help-your-child-with-maths).

##What other nurseries and childminders are doing

^“I am noticing the importance of giving children real opportunities to use numbers in context through finding out about the child’s interests, engaging children in simple tasks and cooking. Making the most of real life opportunities for spotting numbers and shapes as we walk around the environment and community. I realised that it is not just about displaying numbers and number lines in the environment. It is about making numbers real and using them all day long, in everything that I plan for and offer as well as closely observing what the child is doing.”^

Hannah, childminder, Bristol.

##Summary

- Numbers need to be real and meaningful to young children, so it’s important to show them numbers in context.
- Children need real-life maths experiences and the chance to repeat them often. This is how they remember them .
- Use mathematical words to support children’s mathematical thinking.
- Observe what children are doing during play and make the links to numbers in context.
- Having a good range of resources will encourage curiosity and creativity.

##Next steps 

- If possible, take opportunities to visit other settings where maths is a strength.
- Closely observe what children are doing during play and make the links to numbers in context.
- Look at your setting and ask yourself what are the opportunities to use numbers and maths in the daily routines.
- Review your curriculum to ensure you cover the requirements in the EYFS for this area of learning.

$CTA

**Get alerts for new EYFS resources**

[Sign up to get emails when we add new early years foundation stage resources to this website](https://docs.google.com/forms/d/e/1FAIpQLSdZbPz-447CADTErT9eD1IU4yKfsEhyJy1C8U1fyFAQuEtejw/viewform?usp=sf_link)

$CTA', '2021-02-23 17:48:29.35705', '2022-09-06 13:29:55.460318', 13, 1, 14, 13, 't', 'Helen Rapp', 'Learn more about numbers as part of the early years foundation stage (EYFS) including advice from experts and suggested activities.', '{:.contents-list__list}
* {:.contents-list__list-item .contents-list__list-item--dashed} [Why numbers are important](#why-numbers-are-important)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Video](#video)
* {:.contents-list__list-item .contents-list__list-item--dashed}[What the EYFS framework says](#what-the-eyfs-framework-says)
* {:.contents-list__list-item .contents-list__list-item--dashed}[What this means in practice](#what-this-means-in-practice)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Suggested activities](#suggested-activities)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Other activities](#other-activities)
* {:.contents-list__list-item .contents-list__list-item--dashed} [What other nurseries and childminders are doing](#what-other-nurseries-and-childminders-are-doing)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Summary](#summary) 
* {:.contents-list__list-item .contents-list__list-item--dashed} [Next steps](#next-steps)   ', 'Learn more about numbers as part of the early years foundation stage (EYFS), including advice from experts and suggested activities.'),
(16, 'Spatial reasoning', 'spatial-reasoning', '##Why spatial reasoning is important

Spatial reasoning is the understanding of how objects can move in a 3-dimensional world.

Babies use these skills to recognise body parts, and the location of objects and people around them. Young children learn and understand spatial concepts through play, like with shape-sorters. 

Understanding the physical properties of objects allows children to picture shapes in their minds and think about how they could be manipulated. This is an important building block of mathematical thinking. It lies behind problem solving and later maths skills, including geometry. Children are curious and engage naturally in mathematical play.

Children are practising spatial understanding as they use toys like open-ended building blocks or crawl around in dens. It’s important to teach them spatial words to describe what they are seeing. Spatial reasoning is developed through [physical development](/physical-development) and has strong links to [communication and language](/communication-and-language) from birth.

Children use these skills to understand the physical world around them. Understanding spatial relationships allows children to move and navigate in their world. Activities like climbing and squeezing themselves into different types of space develops this further. 

Children will start to recognise and remember how objects have characteristics such as shape, size, volume and weight. Then they can start thinking about the way objects interact and how they can move them and play with them in the 3-dimensional world. 

Problem solving is at the heart of mathematics and children should be encouraged use their creativity and to explore, play and push boundaries. You should be looking for mathematical opportunities during daily activities. 

##Video

In this video, an early years expert explains the importance of spatial reasoning in the early years foundation stage framework. There are also some tips on how to support children in this area.

$YoutubeVideo[OPTIONAL TITLE](https://www.youtube.com/watch?v=9W8yU9jSljQ&list=PL7914115EB65911A5&index=2)$EndYoutubeVideo

##What the EYFS framework says

It is important that the curriculum includes rich opportunities for children to develop their reasoning skills across all mathematical areas including shape, space and measure.

[Statutory framework for the early years foundation stage](https://www.gov.uk/government/publications/early-years-foundation-stage-framework--2). Page 10

##What this means in practice

Children are naturally curious and like to explore. There are many ways you can help children develop spatial reasoning skills.

From birth to 3 years old help children learn how to:

- combine objects like stacking blocks and cups
- put objects inside others and take them out
- play with interesting shapes like corks, cones and balls
- use pots and pans, shape sorters and stacking cups

You can help them build their understanding of the 3-dimensional world with physical activities. Young children usually enjoy squeezing themselves into different types of spaces, like dens. Describe children’s climbing and hiding activities as they play, using spatial words like ‘inside, ‘up’, ‘down’ and ‘below’.

Playing with jigsaw puzzles and inset puzzles is a good way to encourage them to think about shapes.

For children aged 3 and 4 years old, encourage them to play freely with building blocks, interlocking shapes, shape puzzles and shape-sorters. Sensitively support children with questions like: ‘What is the same and what is different?’

Encourage children to talk informally about shape properties using words like ‘sharp corner’, ‘pointy’ or ‘curvy’. Talk about shapes as you play with them, for example ‘do we need a piece with a straight edge?’

Provide a variety of construction materials like blocks and interlocking bricks and encourage children to make constructions. Provide den-making materials if possible. Allow children to play freely with these materials, indoors and outdoors. When appropriate, talk about the shapes and how their properties suit the purpose.

Discuss routes and locations, using words like ‘in front of’ and ‘behind’. Take children out to shops or the park and learn to remember the route and the order of things they see on the way.

Make comparisons between objects relating to size, length, weight and capacity. Provide experiences of size changes. For example, ‘what happens when you stretch elastic?’

##Suggested activities

###Making outdoor dens

You’ll need:  

- large fabric pieces, sheets, curtains 
- cardboard or wooden boxes
- string, rope, masking tape, glue, sticky tape 
- children size chairs, tables and toys to put inside the den

Help the children make constructions based on how their own familiar spaces and enclosures look.

Talk to children about how to construct a den and what they could use. Check the suitability of the resources before using them.

Consider spatial awareness and how many children will fit. Test the stability of the den as you go along to make sure it won’t collapse.

Babies and children under 2 can join in by climbing or crawling in and out of the den which is part of learning how to move their bodies in a 3-dimensional space.

This activity is a useful way to show children the relationships between shapes, for example, how they are using 2-dimensional shapes to make 3-dimensional shapes. It gives you the opportunity to use spatial words such as sides, corners, curves and equal sides.

###How this activity links to the other areas of learning

The activity links to physical development as the children use their hands to put things together developing [fine motor skills](/physical-development/fine-motor-skills). It links to [expressive arts and design](/expressive-arts-and-design) as they use their imagination to think about how to construct the house out of materials. It links to [personal social and emotional development](/personal-social-and-emotional-development) as they discuss the plan and build it together.

###Local community walk

You’ll need to:

- work out a walking route
- walk the route first, carrying out a risk assessment
- draw, or mark on a map, the planned route and leave a risk assessment copy at your setting, and carry one with you on the walk with all the children and adults’ details
- identify places of interest and safe stopping points before you go
- think about using mobiles, cameras or tablets to - take photos or videos of the walk to look at afterwards
- take a mobile phone with you

Discuss with the children what to take on the walk, as well as the planned journey and establish walk rules and expectations.

Find out what children already know about their community, drawing their attention to places of interest as you walk and listen carefully to their responses.

Point out community signs and markers as you walk.

Encourage children to record interesting things using pencils, pads, cameras or tablets. Children could use these to construct or illustrate some of the places of interest back in the setting.

Give children a map, with visual clues. This could add focus to the walk, encouraging thinking, reasoning and discussion between children.

You could make chalk marks on the floor while walking such as arrows, signs and symbols but only if allowed in your local area.

Resources could be added for mathematical enquiry for older children for example, using stopwatches, compasses, chalk.

###How this activity links to the other areas of learning

The walk links to the other areas of the early years maths curriculum as children will see numbers and patterns during the walk. It also links to [understanding the world](/understanding-the-world) as children see road signs and visit areas of the park. As they are taking part in a group activity and following the rules of the walk it links to [personal, social and emotional development](/personal-social-and-emotional-development).

##Other activities

[Can you build this?](https://nrich.maths.org/14690) is an activity to explore shape characteristics, using everyday and mathematical language to describe them. 

[Small world play](https://nrich.maths.org/13531) is an activity to help children work out the space they need for their toys.

[Scooters, bikes and trikes](https://nrich.maths.org/13527) is an activity to work out routes in an outside space.

[Building towers](https://nrich.maths.org/8865) is an activity to help children explore 3D shapes, selecting the best ones to build a tower.

##What other nurseries and childminders are doing

^“We allow our children to explore, experiment with and discover nature, alongside providers and other children. We consider how helpful building block play can be. We monitor how children use building blocks to be creative. We support them to challenge themselves, encouraging them to build complex imaginary constructions.”^

Tracy, Pen Green, Corby.

##Summary

- Children will begin to understand the 3-dimensional world as they build with building blocks, use shape-puzzles or small world toys.

- Use spatial words for shape and space and position such as ‘above’ ‘below’ ‘inside’ ‘outside’ and ‘besides’ as children carry out activities.

- Physical activities in the setting like crawling and tunnelling teach awareness of how children’s bodies move in a 3-dimensional space.

- The understanding of spatial awareness and spatial reasoning forms the mental basis for doing maths in reception class.

##Next steps 

- Encourage children to talk about shape, space and number when sharing ideas.

- Encourage children to ‘have a go’ and not be afraid to make mistakes.

- Think about making dens with the children to encourage building and constructing activities.

- Think about taking the children out to local parks so they can explore outside spaces and learn about making journeys and how to describe them.

- Review your curriculum to ensure you cover the requirements in the EYFS for this area of learning.

$CTA

**Get alerts for new EYFS resources**

[Sign up to get emails when we add new early years foundation stage resources to this website](https://docs.google.com/forms/d/e/1FAIpQLSdZbPz-447CADTErT9eD1IU4yKfsEhyJy1C8U1fyFAQuEtejw/viewform?usp=sf_link)

$CTA', '2021-02-23 17:48:29.366609', '2022-09-06 13:30:20.093707', 13, 3, 25, 14, 't', 'Helen Rapp', 'Learn more about spatial reasoning as part of the early years foundation stage (EYFS) including advice from experts and suggested activities.', '{:.contents-list__list}
* {:.contents-list__list-item .contents-list__list-item--dashed} [Why spatial reasoning is important](#why-spatial-reasoning-is-important)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Video](#video)
* {:.contents-list__list-item .contents-list__list-item--dashed}[What the EYFS framework says](#what-the-eyfs-framework-says)
* {:.contents-list__list-item .contents-list__list-item--dashed}[What this means in practice](#what-this-means-in-practice)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Suggested activities](#suggested-activities)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Other activities](#other-activities)
* {:.contents-list__list-item .contents-list__list-item--dashed} [What other nurseries and childminders are doing](#what-other-nurseries-and-childminders-are-doing)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Summary](#summary) 
* {:.contents-list__list-item .contents-list__list-item--dashed} [Next steps](#next-steps)   ', 'Learn more about spatial reasoning as part of the early years foundation stage (EYFS), including advice from experts and suggested activities.'),
(17, 'Personal, social and emotional development', 'personal-social-and-emotional-development', 'Access resources, activity ideas and advice for teaching personal, social and emotional development to early years children.

##Personal, social and emotional development resources
Resources are split into 3 areas based on the educational programmes: 

[Emotions](/personal-social-and-emotional-development/emotions)

[Sense of self](/personal-social-and-emotional-development/sense-of-self)

[Relationships](/personal-social-and-emotional-development/relationships)

These resources will help you when reviewing your current curriculum to make sure you are meeting the requirement of the revised personal, social and emotional development area of learning.  

As you make changes to your curriculum consider what you want children to learn first and plan opportunities for them to achieve this.

##What the early years foundation stage (EYFS) framework says about personal, social and emotional development

Children’s personal, social and emotional development (PSED) is crucial for children to lead healthy and happy lives, and is fundamental to their cognitive development.

<details class="govuk-details">
<summary class="govuk-details__summary">
<span class="govuk-details__summary-text">
Read more
</span>
</summary>
<div class="govuk-details__text">

<p>Underpinning their personal development are the important attachments that shape their social world.</p>

<p>Strong, warm and supportive relationships with adults enable children to learn how to understand their own feelings and those of others.</p>

<p>Children should be supported to manage emotions, develop a positive sense of self, set themselves simple goals, have confidence in their own abilities, to persist and wait for what they want and direct attention as necessary.</p>

<p>Through adult modelling and guidance, they will learn how to look after their bodies, including healthy eating, and manage personal needs independently.</p>

<p>Through supported interaction with other children they learn how to make good friendships, co-operate and resolve conflicts peaceably.</p>

<p>These attributes will provide a secure platform from which children can achieve at school and in later life.</p>

</div>
</details>

$CTA

**Get alerts for new EYFS resources**

[Sign up to get emails when we add new early years foundation stage resources to this website](https://docs.google.com/forms/d/e/1FAIpQLSdZbPz-447CADTErT9eD1IU4yKfsEhyJy1C8U1fyFAQuEtejw/viewform?usp=sf_link)

$CTA', '2021-02-23 17:48:29.378341', '2021-12-17 15:18:17.180784', NULL, 3, 18, 23, 't', 'Helen Rapp', '', '', ''),
(18, 'Emotions', 'emotions', '##Why emotions are important

Understanding children’s emotions is critical to understanding their behaviour. Early years children feel a range of emotions, but often cannot express, interpret or process them like us.

With poor emotional skills, it could be harder for children to learn:

- acceptance
- resilience
- confidence and control
- how to articulate experiences
- a sense of identity
- empathy
- a sense of self

Research shows that from birth, experiences and adult responses influence how children self-regulate and deal with emotions. Meeting children’s emotions is critical, even when some are harder to understand or when they evoke strong feelings in you.

Behaviour can be an expression of feelings or emotions. To help children make sense of this, and have the best effect, approach them with empathy, supporting and guiding them to identify and deal with their emotions.

##Video

In this video, an early years expert explains the importance of emotions in the early years foundation stage framework. There are also some tips on how to support children in this area.


$YoutubeVideo[OPTIONAL TITLE](https://www.youtube.com/watch?v=U0W2aejgBaU&list=PL7914115EB65911A5&index=1)$EndYoutubeVideo

##What the EYFS framework says

Strong, warm and supportive relationships with adults enable children to learn understanding of their own feelings and those of others. Support children to manage their emotions, develop a positive sense of self, set themselves simple goals, have confidence in their abilities, and to persist and wait for what they want, directing attention as necessary.

[Statutory framework for the early years foundation stage](https://www.gov.uk/government/publications/early-years-foundation-stage-framework--2), page 8.

##What this means in practice

To best meet and support children’s emotions, be sympathetic, warm, accepting and curious. Create connections and show empathy. Listen fully to what a child tells you, with their body language, actions, sounds and words.

Provide words and meanings to name and express emotions, so children can practice how to handle them as they arise.

It’s helpful to allow children to talk about their feelings, like anger or wanting something so badly they snatched it, while also being clear about limits.
 
Help children to have an increasingly expressed understanding of their feelings as they grow older. For example, the development from a 2 year old using an icon to indicate ‘angry’ to a 4 year old who’s able to say, ‘when people leave me out, I feel really sad and angry’ is important.

Provide an emotionally consistent response, following basic emotional coaching steps:

- recognition
- empathy
- ways to label feelings, which validate them
- offering guidance and boundaries to manage 
- emotions
- problem-solving

Support self-expression throughout the day, though stories, drawing, crafts, roleplay and general play, while naming feelings with visual supports.

Your setting should be cosy and homely, and encourage lots of opportunities for conversation. Complement this by letting children choose what they do, as well as with adult-guided play. Both offer opportunities for children to take safe risks, immersing their senses.

As part of helping children to self-regulate and deal with emotions it’s important to set expectations and boundaries for them. They should also understand the importance of following rules and that following rules can keep them safe.

Talk to others about how children’s emotional outbursts make you feel as they can affect you too.

##Suggested activities

###Naming emotions

![Laminated faces showing different emotions
](https://help-for-early-years-providers.education.gov.uk/rails/active_storage/blobs/proxy/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBdk1CIiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--03a0c1ceed0ec9f3db46bc1c563a6b8a1ad7f38d/psed_emotions_activity1.jpg "Laminated faces showing different emotions")

You’ll need:

- laminated faces expressing emotions, including photos of children, their parents and carers, you or other nursery staff
- laminated feelings cards you can carry, as well as an extra set to stick to a feelings board
- a feelings board, to stick cards to
- a laminated thermometer, to show emotion levels

Support children to name their emotions during the daily routine, for example:

- use feelings cards to ask children how they are when they arrive, involving parents and carers where possible.
- talk about how children feel as a group
- use the thermometer or feelings cards when children try tricky new things, like climbing or building something, or during a time of day they find difficult
- when there are conflicts, use feelings cards for children to express and name their related emotions
- when sharing a story, song or circle time activity which mentions a particular emotion, use feelings cards to connect children to it

###How this activity links to the other areas of learning

Children can learn how best to express their emotions [(understanding the world)](/understanding-the-world), and define what each emotion means for them [(sense of self)](/personal-social-and-emotional-development/sense-of-self). They’ll understand how different, well-known images correspond with what they’re feeling [(patterns and connections)](/mathematics/patterns-and-connections), for example a happy, sad or crying face. They’ll develop their skills in comparing their emotions with others and empathising with them [(relationships)](/personal-social-and-emotional-development/relationships).

###All about me

![Laminated book of the child''s favourite things](https://help-for-early-years-providers.education.gov.uk/rails/active_storage/blobs/proxy/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBdlFCIiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--194f4ff1532a94ed7ca182da9579096935f9a092/psed_emotions_activity2.jpg "Laminated book of the child''s favourite things")

To help you get to know the children you could complete an all ‘about me’ with the family. The profile allows you to gather some important facts about the child’s strengths, needs and interests.

Early on when children are settling in with their families it’s a good idea to gather as much information about the child. For example, you can ask who lives in the house and their relationship to the child. This information is important, as these adults are the people who will be significant for the child and have an influence on the child’s life. You can ask about pets, as they often play a special part in a young child’s life too. Also, many families have family names and words that have a special meaning for their children. 

Discuss with the parents whether they would like their family names and words to be used in the setting. For children, to hear familiar words and the use of a family name can offer some reassurance when making the transition from home to setting.  Alongside the parents you can write a profile that celebrates the child’s strengths using the headings:

- The things people love and admire about me.
- What makes me happy.
- How I like to be supported.

The profile can be added to as the child develops in the setting. You can support older children to write and illustrate their own profile.

###How this activity links to the other areas of learning

The focus is on the child’s sense of self. Through the process you will be questioning, describing and recalling, widening their technical vocabulary, as well as technological vocabulary ([communication and language](/communication-and-language)). Children will explore themselves in relation to others and a range of emotions may be explored.

##Other activities

[CBeebies: How to talk to your child about emotions.](https://www.bbc.co.uk/cbeebies/joinin/talking-to-your-child-about-emotions)

[Feeling Better](https://www.bbc.co.uk/teach/class-clips-video/pshe-early-years-foundation-stage-ks1-feeling-better/zm2st39): short videos about different feelings, using puppets.

[What are feelings?](https://www.bbc.co.uk/bitesize/topics/zms6jhv) Dealing with feelings, and recognising others'' feelings.

[The Age of Emotions](https://www.bbc.co.uk/programmes/b0910svk): podcast discussion on emotion culture, with psychotherapist Philippa Perry.

[Word of Mouth](https://www.bbc.co.uk/programmes/b09zxl8y): Naming Emotions: Michael Rosen podcast, about describing feelings.

##What other nurseries and childminders are doing

^“Children can explore emotions through curiosity and literature, which lets them share their thoughts and feelings with confidence during circle time. They are encouraged to build on emotional knowledge - receiving time, attention and comfort by caregivers, and feeling heard.”^

Hannah, Daisychain Nursery, Clifton.

##Summary

- Children need emotionally safe relationships and environments, to explore their emotions.
- Be emotionally present and available, supporting children by recognising, understanding, regulating and expressing their emotions.
- Children’s behaviour can be a result of their emotions or an unmet need.
- You need time, support and space to consider how children’s emotions and behaviour affect your own feelings.

##Next steps

- Reflect on your environment and daily routine, and how these support children and their emotions.
- You may need to talk about the strong feelings that children may express with your colleagues or be aware of them if you are working on your own. How are you feeling about these and developing their understanding of the children’s feelings?
- Create and keep visual prompts, to support children expressing emotions through storytelling.
- Practice potential steps, or a sample script, that could support children to manage their emotions. Share it with parents and carers.
- Consider talking to others about how children’s emotional outbursts make you feel.
- Review your curriculum to ensure you cover the requirements in the EYFS for this area of learning.

$CTA

**Get alerts for new EYFS resources**

[Sign up to get emails when we add new early years foundation stage resources to this website](https://docs.google.com/forms/d/e/1FAIpQLSdZbPz-447CADTErT9eD1IU4yKfsEhyJy1C8U1fyFAQuEtejw/viewform?usp=sf_link)

$CTA

', '2021-02-23 17:48:29.386741', '2022-09-06 13:26:54.397369', 17, 1, 20, 17, 't', 'Helen Rapp', 'Learn more about emotions as part of the early years foundation stage (EYFS) including advice from experts and suggested activities. ', '{:.contents-list__list}
* {:.contents-list__list-item .contents-list__list-item--dashed} [Why emotions are important](#why-emotions-are-important)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Video](#video)
* {:.contents-list__list-item .contents-list__list-item--dashed}[What the EYFS framework says](#what-the-eyfs-framework-says)
* {:.contents-list__list-item .contents-list__list-item--dashed}[What this means in practice](#what-this-means-in-practice)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Suggested activities](#suggested-activities)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Other activities](#other-activities)
* {:.contents-list__list-item .contents-list__list-item--dashed} [What other nurseries and childminders are doing](#what-other-nurseries-and-childminders-are-doing)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Summary](#summary) 
* {:.contents-list__list-item .contents-list__list-item--dashed} [Next steps](#next-steps)   ', 'Learn more about emotions as part of the early years foundation stage (EYFS), including advice from experts and suggested activities. '),
(19, 'Relationships', 'relationships', '##Why relationships are important

Children go to childcare providers with ideas about relationships, influenced by their own experiences. If an adult regularly considers a child’s needs, attachment feelings will develop. If rejected, the child may feel unlovable, unworthy or flawed.
 
Research shows that carer-child relationships build over time, and that this attachment is important for children’s learning, development, wellbeing and future success.

Children must have a ‘key person’. This will either be the childminder or a specific person at a nursery. As a child’s key person, you will provide a special relationship for the child and their parents or carers. This does not mean replacing parents and carers, but having a close ongoing relationship together.

##Video

In this video, an early years expert explains the importance of building trusting relationships in the early years foundation stage framework. There are also some tips on how to support children in this area.

$YoutubeVideo[OPTIONAL TITLE](https://www.youtube.com/watch?v=dmnr9jjhjds&list=PL7914115EB65911A5&index=1)$EndYoutubeVideo

##What the EYFS framework says 

Through supported interaction with others, children learn how to make good friendships, co-operate and resolve conflicts peaceably. These attributes provide a secure platform, from which children can achieve at school and in later life.

[Statutory framework for the early years foundation stage](https://www.gov.uk/government/publications/early-years-foundation-stage-framework--2), page 9.

##What this means in practice

A ‘key person’ is someone a family goes to, who is their advocate and ‘holds them in mind’. Having a good setup process for this secures trusting, ongoing relationships.

Meet parents and carers to decide how best to sensitively settle a child. Put them first, asking them to share all they can about themselves. Value them as the child’s first educators, so they feel able to contribute at any point during their child’s journey.

Children may still need considerable support to feel secure and manage their feelings after the settling in period. You also need space and time to talk about the issues which may arise as you develop close and supportive relationships with children. Discuss it with your colleagues or other providers. 

Induction plans should build on a child’s interests. For example, if you know they love dinosaurs, set some dinosaur toys up on their first visit. If possible, invite parents and carers along while you settle their child, to build trust while personalising their induction.

Make transitions easier by including personal objects, like family books or photo boards. Let children bring comforters if they have one, like a favourite blanket or toy. Share your philosophy, values, routines, procedures and policies with parents and carers, so they understand how and why things happen. Allow them to contribute or give feedback.

Once a child is settled, maintain relationships with them, their parents and carers. As you get to know them all better, you’ll gain confidence when sharing developments you have noticed, perhaps during a daily chat. Reflect together about the child’s learning. This will allow you to give a responsive ongoing learning environment.

##Suggested activities

###Family board

![Display of child''s family](https://help-for-early-years-providers.education.gov.uk/rails/active_storage/blobs/proxy/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBdlVCIiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--c9ff1de65be73a3d815226101c40d787155af12b/psed_relationships_activity1.jpg "Display of child''s family")

You’ll need:

- photographs of the child’s special people, these could be gathered on a home visit, when parents and carers first visit your setting, or could be sent in
- a board to attach them to 
- a way to attach and remove them, such as sticky tape
- pens, pencils, craft materials
- laminating tools (optional)

Display the photos attractively but simply across the board. Consider laminating family photos. Use reusable attachments such as velcro, so children can carry their special people around, but photos won’t be lost.

Get parents and carers to help create the board. Ask them to think about what they want to share about themselves and their child or what their hopes and aspirations are for the nursery or childminder experience.

Display the board at the child’s height, near where the child spends most of their time, and together with other family boards. Allow children to approach and observe their own board as much as they want. Supporting them to talk about their special people. This reassures them, while prompting ongoing chat that deepens the relationship between a child and their key person.

###How this activity links to the other areas of learning

Children will be able to talk about their community and special people [(understanding the world)](/understanding-the-world), including parents, carers, extended family members and other special people [(sense of self)](/personal-social-and-emotional-development/sense-of-self). They will be able to go into detail about related aspects such as who drops them off, who picks them up, who they are friends with [(communication and language)](/communication-and-language). They will help to physically make the family boards [(expressive arts and design)](/expressive-arts-and-design).

###Relational timeline

A relational timeline provides an opportunity for a young child to share with you their personal relationships.

You’ll need
 
- card
- photographs
- sticky fasteners
- laminated sheets

Collect photos of the important people in the child’s life, their family, friends and other significant people. For younger children, ask the family to share with you their day and what happens through the day, for example, who drops them at the setting, who picks them up.

You can find out who they have been with in the day, for example who has changed their nappy, who has rocked them to sleep, who they have had lunch with. Older children will be able to represent this themselves. Display the timeline on the wall. Give time for the children to talk to you about the significant people in their lives and their connections to them. Observe the children’s gestures, ask questions and listen to their responses.

###How this activity links to the other areas of learning
The focus is on the children’s relationships to others. Through the process you will be questioning, describing and widening their technical vocabulary, as well as technological vocabulary ([communication and language](/communication-and-language)). Handling the objects develops the children’s fine motor skills ([physical development](/physical-development)). Mathematical language will also arise to describe comparative words such as older than, oldest, new and newest ([mathematics](/mathematics)). Children will develop a sense of self in relation to others. It also helps develop their understanding of the world. 

##Other activities

[How to build positive relationships in the early years, TES.](https://www.tes.com/news/how-build-positive-relationships-early-years)

[Positive relationships, Early Years Educator.](https://www.earlyyearseducator.co.uk/features/article/positive-relationships)

[Tips on supporting positive relationships in the moment, Nursery World.](https://www.nurseryworld.co.uk/features/article/positive-relationships-behaviour-in-the-moment)

##What other nurseries and childminders are doing

^“Developing a secure relationship between myself, children and their parents or carers is at the heart of my practice. Children learn best when they feel safe and secure, with their relationships displaying mutual trust and respect. I recognise that parents are a child’s first educators, the information they share builds a picture of each child. I use this picture to cater to each child’s interests and curiosities, allowing secondary attachment to occur. A secure relationship like this allows for solid learning understanding. Without such attachments, children may feel insecure, impacting their development.”^

Sam, childminder, Kettering.

##Summary 

- Solid key relationships are fundamental to well-being, cognition and learning.
- A child’s key person sustains a trusting relationship between child, parents and carers.
- Engaging families as equal, active partners helps maintain these relationships.
- Emotional availability and presence promote trust within these relationships.
- A structured relationship setup system allows these relationships to thrive.

##Next steps

Consider:

- how does each individual child inform your planning for transitions and how do you personalise your offer?
- do your policies and procedures for home visits and settling facilitate parental engagement and voice?
- what systems do you have in place within your team that supports reflection on relationships with individual children, personal responses and pedagogy?

$CTA

**Get alerts for new EYFS resources**

[Sign up to get emails when we add new early years foundation stage resources to this website](https://docs.google.com/forms/d/e/1FAIpQLSdZbPz-447CADTErT9eD1IU4yKfsEhyJy1C8U1fyFAQuEtejw/viewform?usp=sf_link)

$CTA
', '2021-02-23 17:48:29.396804', '2022-09-06 13:27:17.638698', 17, 3, 9, 20, 't', 'Helen Rapp', 'Learn more about relationships as part of the early years foundation stage (EYFS) including advice from experts and suggested activities.', '{:.contents-list__list}
* {:.contents-list__list-item .contents-list__list-item--dashed} [Why relationships are important](#why-relationships-are-important)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Video](#video)
* {:.contents-list__list-item .contents-list__list-item--dashed}[What the EYFS framework says](#what-the-eyfs-framework-says)
* {:.contents-list__list-item .contents-list__list-item--dashed}[What this means in practice](#what-this-means-in-practice)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Suggested activities](#suggested-activities)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Other activities](#other-activities)
* {:.contents-list__list-item .contents-list__list-item--dashed} [What other nurseries and childminders are doing](#what-other-nurseries-and-childminders-are-doing)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Summary](#summary) 
* {:.contents-list__list-item .contents-list__list-item--dashed} [Next steps](#next-steps)   ', 'Learn more about relationships as part of the early years foundation stage (EYFS), including advice from experts and suggested activities.'),
(20, 'Sense of self', 'sense-of-self', '##Why sense of self is important

Babies develop a sense of self by interacting with others and by exploring their bodies and the objects around them.

Feelings of identity grow as you make attempts to understand what a child is thinking. The more you interact with a child and help them to express themselves in words the more understood they will feel. A sense of self comes from the experience of being in the mind of others, feeling valued and understood. If children do not feel understood this can affect feelings of intimacy, trust and attachment later in life.

Human behaviour is motivated by a desire to belong and find a place in the group, in our families, neighbourhoods, schools and society. Relationships with others help children understand that they have a place in society. Supporting children to understand diversity, including that others will have a different background or family type from themselves, will help all children to feel valued and understood.

Sharing everyday experiences supports children’s understanding of how social interactions work. Childcare settings are where children meet new adults and other children.

##Video

In this video, an early years expert explains the importance of sense of self in the early years foundation stage framework. There are also some tips on how to support children in this area.


$YoutubeVideo[OPTIONAL TITLE](https://www.youtube.com/watch?v=U8WA_tJyogM&list=PL7914115EB65911A5&index=2)$EndYoutubeVideo

##What the EYFS framework says

Strong, warm and supportive relationships with adults enable children to learn how to understand their own feelings and those of others. Children should be supported to manage emotions, develop a positive sense of self, set themselves simple goals, have confidence in their own abilities, to persist and wait for what they want and direct attention as necessary.

[Statutory framework for the early years foundation stage](https://www.gov.uk/government/publications/early-years-foundation-stage-framework--2), page 8.

##What this means in practice

Children need to explore their own potential to discover new things and develop their knowledge and interests. To support children to achieve this you should offer a wide selection of activities planned around children’s individual interests.

Encourage children in your home or nursery setting to make choices. Support children to feel good about themselves and their choices as this will increase their confidence.

Be patient and attentive. The way you interact with children will encourage their sense of themselves and self-confidence. Knowing each child is the key to supporting their sense of self, so plan the environment to reflect their interests.

Make sure children know where everything is in the setting. It helps to offer them continuity and consistency. This supports children to use the environment independently.

A predictable routine encourages a secure sense of self. Giving children advance notice that things are going to change helps them feel prepared. Talk with parents and carers to prepare children for changes to their normal routine.

##Suggested activities

###''Our names, ourselves''

Early in the year ask parents or carers how and why their child''s names were chosen. You’ll hear all sorts of family stories and the deeper meaning of some of the names. It can sometimes be quite moving and often intergenerational, for example  when children are named after a Grandad. You and the children can make books called ‘the stories of our names’ and they can think about how their names connect to themselves and their families. 

Children will enjoy hearing the story of their names and listening to the story of other children''s names.

You can also talk about other family members’ names. Try to learn their names as well as the childrens’ so you can welcome them each day. This leads into the idea that families may have stories or traditions that are specific to them, such as new pyjamas every Christmas Eve, lighting a candle if you pass a Church or an annual family holiday. This will give you a range of materials to work with every year but it starts from the families and works outwards.

###How this activity links to the other areas of learning

The focus is on the child’s sense of self. Through the process you will be questioning, describing and widening their technical vocabulary, as well as technological vocabulary ([communication and language](/communication-and-language)). Handling the objects develops the children’s fine motor skills ([physical development](/physical-development)). Children will explore themselves in relation to others and a range of emotions may be explored.

###Non-verbal storying

You’ll need:

- a range of open-ended found materials, such as newspaper, cardboard boxes and tubes
- a large whiteboard or paper
- a simple story script that the adult has written, based upon a familiar conflict, such as a conflict over sharing a special toy

Gather the children in small groups as part of your familiar story-time routine.

Draw their attention to a line of masking tape on the floor. This indicates the ‘stage’ area where the story will take place.

Use found material resources to create characters and props in front of the children’s eyes, as the story takes place.

Follow basic 3-point story arc, setup, problem and solution. This should focus on an aspect of emotional learning that children are currently being challenged by, such as sharing resources, or being separated from a parent at drop-off.

Use noises, vocal intonations and drawn symbols and faces to signal thoughts or feelings.

Pause throughout for ‘I wonder’ moments, offering children a chance to contribute their ideas around characters’ feelings or possible resolutions.

At the end of the story, leave the resources for children to explore, perhaps using the pre-made characters to re-tell, innovate or invent stories, or create their own props and characters using the modelling resources.

###How this activity links to the other areas of learning

The focus is on children expressing emotions. Through the process you will be questioning, describing and widening their technical vocabulary, as well as technological vocabulary ([communication and language](/communication-and-language)). Handling the objects develops the children’s fine motor skills and enacting the experiences gross motor skills ([physical development](/physical-development)). Children will explore their developing sense of self and their relationships with others.
 
##Other activities

The [I see you](https://www.bbc.co.uk/tiny-happy-people/i-see-you/znvw382) game helps children learn some identity skills.

The [Make a treasure box](https://www.bbc.co.uk/tiny-happy-people/explore-a-treasure-box-18-24/zkyyy9q) and [Make a memory book](https://wordsforlife.org.uk/activities/make-memory-book/) activities help them to store memories about themselves and make a history.

##What other nurseries and childminders are doing

^“In our childcare setting each child has their own special box. They can put whatever they want in it, for example their blanket or a toy car”.^

Nursery worker, Pen Green centre, Corby.

^“We care for children as individuals and remember what is happening. If they leave on Friday telling us about going to a birthday party at the weekend we will talk to them on Monday about it. We also make sure we remember the important people in their lives”.^

Nursery worker, Kingswood nursery, Corby

##Summary

- Children who have a sense of self are able to challenge themselves. This helps them become independent and secure to face challenges in other areas of learning. 

- If children do not feel a sense of security, they may not be able to settle into their environment and may struggle to learn or develop.

- If you respond to children and try to understand their feelings, they will feel safe. A feeling of safety encourages children to be their own person and take part in the experiences on offer.

- Children need to try out different ways for asserting themselves and keeping themselves safe.

##Next steps

Consider this as a possible activity to examine how well you know each child. This will help you develop an awareness of their sense of self. 

Imagine the child is asking you these questions. What would you answer on their behalf?

- Do you know me?
- Can I trust you?
- Do you hear me?
- Is this a fair place for me?

We suggest doing this every half term and going back to revisit it. You could keep a folder for each child.

Consider how your curriculum supports children to play independently.

Review your curriculum to ensure you cover the requirements in the EYFS for this area of learning.

$CTA

**Get alerts for new EYFS resources**

[Sign up to get emails when we add new early years foundation stage resources to this website](https://docs.google.com/forms/d/e/1FAIpQLSdZbPz-447CADTErT9eD1IU4yKfsEhyJy1C8U1fyFAQuEtejw/viewform?usp=sf_link)

$CTA', '2021-02-23 17:48:29.405172', '2022-09-06 13:27:05.795077', 17, 2, 19, 18, 't', 'Helen Rapp', 'Learn more about sense of self as part of the early years foundation stage (EYFS) including advice from experts and suggested activities.', '{:.contents-list__list}
* {:.contents-list__list-item .contents-list__list-item--dashed} [Why sense of self is important](#why-sense-of-self-is-important)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Video](#video)
* {:.contents-list__list-item .contents-list__list-item--dashed}[What the EYFS framework says](#what-the-eyfs-framework-says)
* {:.contents-list__list-item .contents-list__list-item--dashed}[What this means in practice](#what-this-means-in-practice)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Suggested activities](#suggested-activities)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Other activities](#other-activities)
* {:.contents-list__list-item .contents-list__list-item--dashed} [What other nurseries and childminders are doing](#what-other-nurseries-and-childminders-are-doing)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Summary](#summary) 
* {:.contents-list__list-item .contents-list__list-item--dashed} [Next steps](#next-steps)   ', 'Learn more about sense of self as part of the early years foundation stage (EYFS), including advice from experts and suggested activities.'),
(21, 'Physical development', 'physical-development', '
Access resources, activity ideas and advice for supporting early years children with physical development.

## Physical development resources 

Resources are split into 3 areas based on the educational programmes: 

[Core strength and co-ordination](/physical-development/core-strength-and-co-ordination)

[Gross motor skills](/physical-development/gross-motor-skills)

[Fine motor skills](/physical-development/fine-motor-skills)

These resources will help you when reviewing your current curriculum to make sure you are meeting the requirement of the revised physical development area of learning.  

As you make changes to your curriculum consider what you want children to learn first and plan opportunities for them to achieve this.

## What the early years foundation stage (EYFS) framework says about physical development

Physical activity is vital in children’s all-round development, enabling them to pursue happy, healthy and active lives.

<details class="govuk-details">
<summary class="govuk-details__summary">
<span class="govuk-details__summary-text">
Read more
</span>
</summary>
<div class="govuk-details__text">
<p>Gross and fine motor experiences develop incrementally throughout early childhood, starting with sensory explorations and the development of a child’s strength, co-ordination and positional awareness through tummy time, crawling and play movement with both objects and adults.</p>

<p>By creating games and providing opportunities for play both indoors and outdoors, adults can support children to develop their core strength, stability, balance, spatial awareness, co-ordination and agility.</p>

<p>Gross motor skills provide the foundation for developing healthy bodies and social and emotional well-being.</p>

<p>Fine motor control and precision helps with hand-eye co-ordination which is later linked to early literacy.</p>

<p>Repeated and varied opportunities to explore and play with small world activities, puzzles, arts and crafts and the practise of using small tools, with feedback and support from adults, allow children to develop proficiency, control and confidence.</p>

</div>
</details>

$CTA

**Get alerts for new EYFS resources**

[Sign up to get emails when we add new early years foundation stage resources to this website](https://docs.google.com/forms/d/e/1FAIpQLSdZbPz-447CADTErT9eD1IU4yKfsEhyJy1C8U1fyFAQuEtejw/viewform?usp=sf_link)

$CTA', '2021-02-23 17:48:29.42144', '2021-12-17 15:12:25.212742', NULL, 2, 22, 4, 't', 'Helen Rapp', '', '', ''),
(22, 'Core strength and co-ordination', 'core-strength-and-co-ordination', '##Why core strength and co-ordination is important

Core strength is children’s ability to keep their position and move from the centre of their body outwards. If core strength is underdeveloped, children will struggle with gross motor skills and fine motor skills, stability and balance. This will affect their ability to coordinate more refined movements.

Coordination is the brain’s ability to control movement of different body parts at the same time. When babies are born, their most developed body part is their head, and the least developed is their feet. It takes 2 months before an infant recognises their hands as their own.

To be confident with movement children must develop both core strength and coordination. 

Developing core strength and co-ordination supports children’s ability to communicate, learn language and eventually read and write. Whole body movements contribute to the accurate use of small tools and delicate materials. Writing, drawing and painting should be considered as whole-body skills.

##Video

In this video, an early years expert explains the importance of core strength and co-ordination in the early years foundation stage framework. There are also some tips on how to support children in this area.


$YoutubeVideo[OPTIONAL TITLE](https://www.youtube.com/watch?v=xjxXBZeFcmg&list=PL7914115EB65911A5&index=6)$EndYoutubeVideo

##What the EYFS framework says

By creating games and providing opportunities for play both indoors and outdoors, adults can support children to develop their core strength, stability, balance, spatial awareness, co-ordination and agility.

[Statutory framework for the early years foundation stage](https://www.gov.uk/government/publications/early-years-foundation-stage-framework--2), page 9.

##What this means in practice

Children must have plenty of opportunities to play indoors and outdoors. They need to be active and use their whole bodies in as many different, challenging ways as possible. Over time children have more control over their bodies, and what they can do. Less happens by chance, and movements become more deliberate, being achieved with confidence.

Children are naturally curious and love to play physically, exploring possible movement opportunities. Movement play, encouraged through challenging spaces and open-ended resources, allows children to start their own games.

Observe how the core strength of babies and children is developed. You can then decide if what you provide, indoors and outdoors, is meeting their physical development needs.

When observing babies and young children at play, notice their ‘postural reflexes’ that support their ability to sit up, stand still, maintain balance and move in a coordinated way. 

Observe their confidence using tools like a gardening trowel, and wheeled toys such as  a wheelbarrow, tricycle or balance bike.

Plan what you provide, so babies and young children can roll, crawl, walk, run, jump, balance, throw, catch, and ride wheeled toys. Well-planned play spaces let children move freely, developing their body strength. 

This core strength helps develop senses, spatial awareness, [gross motor skills](/physical-development/gross-motor-skills), [fine motor skills](/physical-development/fine-motor-skills), visual development and limb co-ordination. 

##Suggested activities

###Gardening 

You’ll need:

- an outdoor area
- child-sized gardening gloves
- tools
- containers and plant pots, including found resources
- seeds
- plants
- soil, for container gardening and bulb planting

For some settings this may mean gardening on a smaller scale in containers and pots. Support children to weed the garden area. Children love to collect weeds in buckets and wheelbarrows, transporting them to the composting area.

Children dig over the garden area with your help to prepare for sowing seeds and planting plants.

Sow vegetable and flower seeds. Problem-solve with children about how to protect outdoor areas. Make homemade labels, showing where seeds have been sown. Strike a balance between plants that grow quickly, like lettuce and cress, and those that take a little longer.

Put out various containers for sowing seeds, like egg cartons and plastic trays. Children can use found materials and think about what works best, and why.

You could also buy plants to plant. Children enjoy the process of digging holes, placing the plants in and then pressing the soil down to make sure they’re in position. Movements like this further develop core strength and coordination.

Gardening supports and extends children’s physical development, muscular strength, fine motor skills and coordination. Bending over to pull up weeds, lifting a stone or picking up a soil bucket all support developing core strength. Joints are strengthened and made more flexible.

Check that any plants you use are appropriate, some can be poisonous, or have sharp thorns.

If you’re inexperienced in gardening here’s [the Royal Horticultural Society’s beginners guide](https://www.rhs.org.uk/advice/beginners-guide).

Cbeebies also have [guidance on gardening with young children](https://www.bbc.co.uk/cbeebies/grownups/7-tips-for-gardening-with-children).

###How this activity links to the other areas of learning

Children help to make labels, learning that [literacy](/literacy) skills have real purpose. Gardening relates to children’s [understanding of the world](/understanding-the-world). There are good opportunities to enrich and widen children’s [widening vocabulary](/understanding-the-world/widening-vocabulary), learning the correct names of plants and gardening tools, while describing, informing, predicting and reasoning. Gardening allows you to talk about the ecological part of [understanding the world](/understanding-the-world) with growing food, re-using containers and water conservation by collecting rainwater in a water butt.

###Adventurous climbing and swinging

Adventurous climbing outside develops children’s core strength and coordination. The best resource for adventurous climbing is an accessible tree. You can also attach a swing. Swings help develop children’s core strength because of the muscles they use to sit securely and move with their legs.

If there are no trees in your setting or childminder home, look for other local opportunities.
  
Tree stumps are equally challenging, especially when arranged together. They can be donated or bought.
 
Follow health and safety guidance and complete the appropriate risk assessments. You could consider buying helmets for safe play.
  
Support every child to explore trees, tree stumps and fallen branches at their level of confidence. Words of encouragement work better than being physically supportive unless the child has a specific physical need. Encourage children to think about their safety and how to climb or adjust their bodies to balance so they know when something feels unsafe.  
 
Praise every child’s efforts. Even holding onto the trunk is an achievement, especially for very young children.
 
Daily experiences are the best for every child to develop their core strength and coordination over time.
 
Provide ‘woodland’ climbing daily, including low level climbing for children who find physical movement a challenge. Babies need the opportunity to have tummy time outside on different natural surfaces.

###How this activity links to the other areas of learning

Keep the atmosphere calm when children are engaged in adventurous play as they gain confidence in their physical capabilities ([personal, social and emotional development](/personal-social-and-emotional-development)). Children have to maintain attention as they negotiate spaces and other children ([communication and language](/communication-and-language)). Being in the natural environment nourishes children’s understanding of the world.


##Other activities

[Early movers](https://www.earlymovers.org.uk/) has lots of physical development activity ideas. 

[NHS physical activity guidelines for children under 5.](https://www.nhs.uk/live-well/exercise/physical-activity-guidelines-children-under-five-years/)

##What other nurseries and childminders are doing

^“We want to make the outdoor learning environment more challenging for the children. We tied two lengths of climbing rope between two trees, to create walkways. These have improved children’s muscular strength, coordination, balance and agility. As soon as the babies are walking, they are helping in the garden, watering and sweeping are their favourite tasks.”^

Mandy, Naturally Learning, Truro.

^“I have different sized chairs to meet the needs of the growing child, starting with high chairs. This means children sit with the correct posture. This supports them when eating their meals or when they want to draw and play games.”^

Julie, childminder, Ilkley.

##Summary 

- Core strength is children’s ability to maintain their position and move from the centre of their body outwards.
- Co-ordination is the brain’s ability to control different body part movements at the same time.
- Children''s early years are important to sensory and physical development. 
- Children’s core strength and co-ordination are essential to developing their ability to move in different ways, control their movements as well as fine motor control.
- Developing children’s core strength and coordination means they can be more agile, flexible, well-coordinated, balanced and motivated to take part in physical activity.

##Next steps 

- Notice the physical development achievements of the children you work with. Compare what you find out with colleagues, or another provider. Consider if your curriculum  enables all children to improve their core strength.
- Review what you want children to learn, making sure there are opportunities for children to develop their core strength and coordination.
- Share with others your best practice for supporting children’s core strength and co-ordination. 
- Review your curriculum to ensure you cover the requirements in the EYFS for this area of learning.

$CTA

**Get alerts for new EYFS resources**

[Sign up to get emails when we add new early years foundation stage resources to this website](https://docs.google.com/forms/d/e/1FAIpQLSdZbPz-447CADTErT9eD1IU4yKfsEhyJy1C8U1fyFAQuEtejw/viewform?usp=sf_link)

$CTA
', '2021-02-23 17:48:29.432148', '2022-09-06 13:26:07.067856', 21, 1, 24, 21, 't', 'Helen Rapp', 'Learn more about core strength and co-ordination as part of the early years foundation stage (EYFS) including advice from experts and suggested activities. ', '{:.contents-list__list}
* {:.contents-list__list-item .contents-list__list-item--dashed} [Why core strength and co-ordination is important](#why-core-strength-and-co-ordination-is-important)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Video](#video)
* {:.contents-list__list-item .contents-list__list-item--dashed}[What the EYFS framework says](#what-the-eyfs-framework-says)
* {:.contents-list__list-item .contents-list__list-item--dashed}[What this means in practice](#what-this-means-in-practice)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Suggested activities](#suggested-activities)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Other activities](#other-activities)
* {:.contents-list__list-item .contents-list__list-item--dashed} [What other nurseries and childminders are doing](#what-other-nurseries-and-childminders-are-doing)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Summary](#summary) 
* {:.contents-list__list-item .contents-list__list-item--dashed} [Next steps](#next-steps)   ', 'Learn more about core strength and co-ordination as part of the early years foundation stage (EYFS), including advice from experts and suggested activities. '),
(23, 'Fine motor skills', 'fine-motor-skills', '##Why fine motor skills are important

Fine motor skills involve small muscles working with the brain and nervous system to control movements in areas such as the hands, fingers, lips, tongue and eyes. Developing fine motor skills helps children do things like eating, writing, manipulating objects and getting dressed. 

A baby uses their fingers and thumbs to pick things up. They will also feel and taste objects with their mouth and lips. An older child will use their fine motor skills for actions like pulling up a zip or using scissors to cut up paper. These important skills will contribute to a child’s development and independence across all areas of learning.

Research shows that the development of fine motor skills depends on the development of [gross motor skills](/physical-development/gross-motor-skills) and that a joined-up approach to physical development is important. Young children need many opportunities to develop fine motor skills alongside gross motor skills so they can become confident to explore the world around them. 

From a very young age, children are exploring different materials. With these materials a child will naturally start to make marks. Babies might use their whole bodies to make marks with mud, paint or cornflour in a tuff tray, or with food at mealtimes. A toddler might splash in a puddle and notice the  prints they make. 

Mark making is an important experience for children because over time they can attribute meaning to their marks. Combined with a child’s developing dexterity, these marks become refined and deliberate, until the point at which the young child labels their marks, either as pictures or writing.

##Video

In this video, an early years expert explains the importance of fine motor skills in the early years foundation stage framework. There are also some tips on how to support children in this area.


$YoutubeVideo[OPTIONAL TITLE](https://www.youtube.com/watch?v=uR2tmJ60vNg&list=PL7914115EB65911A5&index=4)$EndYoutubeVideo

##What the EYFS framework says

Gross and fine motor experiences develop incrementally throughout early childhood, starting with sensory explorations and the development of a child’s strength, co-ordination and positional awareness through tummy time, crawling and play movement with both objects and adults.

Fine motor control and precision helps with hand-eye co-ordination which is later linked to early literacy. Repeated and varied opportunities to explore and play with small world activities, puzzles, arts and crafts and the practise of using small tools, with feedback and support from adults, allow children to develop proficiency, control and confidence.

[Statutory framework for the early years foundation stage](https://www.gov.uk/government/publications/early-years-foundation-stage-framework--2), page 9.

##What this means in practice

You can help children develop fine motor skills by providing an environment, experiences and activities that encourage a joined-up approach to physical development.

Your environment should provide rich and varied opportunities for large and small movements. For babies this may involve providing materials that they can grasp, grip, bash, squash and poke such as crinkly paper, wooden spoons and stretchy fabric. For older children, provide activities that require small hand movements such as stirring a magic potion, pegging washing on a line or exploring wet and dry sand.

Provide interesting experiences which help children practice fine motor skills. Cooking, gardening, sewing, fixing and making things are all good examples of activities that involve using tools and small movements with accuracy and precision. The fine manipulative control skills developed in these activities will begin to provide the foundations for holding a pencil for drawing, mark-making and writing when children are developmentally ready.

You should make sure that every child is supported in developing their fine motor skills. When a child experiences difficulties, you can support them by making changes to materials or activities, or by giving gentle praise and encouragement.

##Suggested activities

###Weaving

You’ll need:

- materials for weaving such as ribbon, threads, string, strips of fabric, plastic tags, wool, rafia, bead strings, natural materials, such as, twigs, leaves, lichen or seed heads
- extra materials to thread through attaching with the strips such as beads, hoops, paper clips, buttons, discarded pieces from construction toys, toy wheels, paper or treasury tags, or wooden sticks
- a mesh or a weaving frame, to move different materials in and out to make a weave

There are many cheap materials that can be used for the mesh, including drain mesh, rigid garden mesh, a discarded bicycle wheel or homemade frame either out of wood or sticks.
 
Weaving can be done outside and inside. Arrange the materials so that they invite children to get involved. Support their natural curiosity and gently suggest how they might manipulate the materials.
 
This activity will help them to grasp, develop their pincer grip and to manipulate different materials. Look for high levels of involvement and note each child’s dexterity, This will inform you as to whether the materials selected are suitable and offer a degree of challenge.

###How this activity links to the other areas of learning

Describing the child’s actions will support widening vocabulary within a context that is meaningful ([communication and language](/communication-and-language)). Plenty of experience manipulating materials, creating weavings develops hand eye coordination for emerging reading and writing ([literacy](/literacy)). There are opportunities for children to experience shape, pattern and quantities ([mathematics](/mathematics)). Making weavings in different materials develops a child’s self-expression and imagination. Over time they are more able to design with intent as their familiarisation with materials and how they can manipulate them becomes embedded ([expressive arts and design](/expressive-arts-and-design)). Large meshing and weaving frames offer children the opportunity to create together ([personal, social and emotional development](/personal-social-and-emotional-development)). Find images of weaving with different materials to display in the setting. These images can inspire and motivate as well as complement the children’s creations ([understanding the world](/understanding-the-world)).


###Cooking

You’ll need:

- simple recipes
- ingredients for your recipe
- simple tools such as rolling pins, bowls, jugs and baking tins

Regularly involving young children in preparing and cooking food is a very motivating way of developing fine motor skills.

Choose simple recipes that involve combining ingredients and that use simple tools. Find out from children''s parents and carers what they like to prepare at home and make sure that the recipes you use reflect your setting''s diverse community.

Mixing, squeezing, pouring and spreading during cooking help to develop fine motor and hand-eye coordination skills. Rolling and flattening dough with the hands or with a rolling pin helps children practice using both hands in a coordinated way. Pouring ingredients into bowls and spooning batter into tins are good ways to practice hand-eye coordination.

For children who struggle to grasp and pour, provide kitchen utensils that are designed for ease of use. 

###How this activity links to the other areas of learning

Over time children are increasingly confident in talking about cooking using the correct vocabulary to describe ingredients and processes [(communication and language)](/communication-and-language). Cooking involves the understanding of mathematical concepts such as counting, weighing and understanding quantity [(mathematics)](/mathematics). Cooking relates to the children’s personal experiences [(understanding the world)](/understanding-the-world). Cooking is a reflection of the diverse world and gives children the opportunity to make comparisons between different types of food.

##Other activities

[Easy cooking with kids](https://www.bbc.co.uk/cbeebies/curations/easy-cooking-with-kids-recipes) from Cbeebies.

[Making homemade playdough](https://www.bbc.co.uk/tiny-happy-people/homemade-playdough/z4tdd6f) from the BBC’s Tiny Happy People.

Early Education has [suggestions for outdoor mark-making activities](https://www.early-education.org.uk/mark-making-resources-outside).

##What other nurseries and childminders are doing

^“We try to make developing fine motor control interesting for children. An example is filling balloons with water overnight to make ice balloons. We peeled the rubber balloon off the frozen shape and put it on a big tray. Children had small pots of food colouring and plastic pipettes, small pots of salt with teaspoons, and other tools for exploring the ice. Children used a pincer grip to drip the food colouring over the ice balloons and to carefully spoon salt into the cracks that appeared. We noticed colourful patterns in the melting ice and showed children how to use the tools to chip and chisel holes and cracks. It was really motivating for children who might not choose activities that encouraged hand strength and control otherwise.”^

Kate, Filton Avenue Nursery School, Bristol

##Summary

- Fine motor skills help children to navigate and explore the world with confidence and independence.
- Fine motor skills depend on gross motor skills. You need a joined-up approach for developing whole body physicality and strength.
- Rich outdoor and indoor environments will provide opportunities for developing fine motor skills.
- Meaningful and real experiences like cooking are motivating for children and provide good opportunities for developing fine motor skills and coordination.

##Next steps

- Consider how providing small, natural materials for children to explore will support fine motor skills.
- Explore how everyday routines and experiences in your setting such as preparing snacks or tidying up could support children to practise fine motor skills.
- Review your curriculum to ensure you cover the requirements in the EYFS for this area of learning.

$CTA

**Get alerts for new EYFS resources**

[Sign up to get emails when we add new early years foundation stage resources to this website](https://docs.google.com/forms/d/e/1FAIpQLSdZbPz-447CADTErT9eD1IU4yKfsEhyJy1C8U1fyFAQuEtejw/viewform?usp=sf_link)

$CTA', '2021-02-23 17:48:29.447568', '2022-09-06 13:26:38.978739', 21, 3, 17, 24, 't', 'Helen Rapp', 'Learn more about fine motor skills as part of the early years foundation stage (EYFS) including advice from experts and suggested activities.', '{:.contents-list__list}
* {:.contents-list__list-item .contents-list__list-item--dashed} [Why fine motor skills are important](#why-fine-motor-skills-are-important)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Video](#video)
* {:.contents-list__list-item .contents-list__list-item--dashed}[What the 
EYFS framework says](#what-the-eyfs-framework-says)
* {:.contents-list__list-item .contents-list__list-item--dashed}[What this means in practice](#what-this-means-in-practice)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Suggested activities](#suggested-activities)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Other activities](#other-activities)
* {:.contents-list__list-item .contents-list__list-item--dashed} [What other nurseries and childminders are doing](#what-other-nurseries-and-childminders-are-doing)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Summary](#summary) 
* {:.contents-list__list-item .contents-list__list-item--dashed} [Next steps](#next-steps)   ', 'Learn more about fine motor skills as part of the early years foundation stage (EYFS), including advice from experts and suggested activities.'),
(24, 'Gross motor skills', 'gross-motor-skills', '##Why gross motor skills are important

Gross motor skills are the skills that children develop using their whole body. You can see this from a baby’s earliest efforts to move and travel, to young children coordinating whole body movements. By using their whole bodies children become increasingly confident, agile and flexible.

All children need to be confident in their gross motor skills and movements. For some children this confidence will come in smaller steps and take longer to achieve. Be patient, giving them time and space, and encouraging words. Take expert advice for children with physical and mobility additional needs. This may increase childrens’ development of muscular strength, ability to take well intentioned, safe risks and become increasingly well-coordinated.

Gross motor skills affect wellbeing and give children opportunities to socialise in play. Confidence and coordination in gross motor skills are essential for children in developing their [fine motor skills](/physical-development/fine-motor-skills).

##Video

In this video, an early years expert explains the importance of gross motor skills in the early years foundation stage framework. There are also some tips on how to support children in this area.


$YoutubeVideo[OPTIONAL TITLE](https://www.youtube.com/watch?v=VEw6w4aQdEY&list=PL7914115EB65911A5&index=5)$EndYoutubeVideo

##What the EYFS framework says

Gross motor skills provide the foundation for developing healthy bodies and social and emotional well-being.

[Statutory framework for the early years foundation stage](https://www.gov.uk/government/publications/early-years-foundation-stage-framework--2), page 9.

##What this means in practice

Children need access to indoor and outdoor environments that help develop their gross motor skills, with you to guide and support them, every day. Outdoors is where children have the freedom to be as physical as they can be.

Walking to local green spaces can help build children''s stamina. If babies and children have to be pushed to a destination, on arrival, give them opportunities to move around on the woodland floor, the grassy area in the park or the pebbly beach.

When considering children’s gross motor skills think of crawling, walking, running, jumping, hopping, skipping, creeping and slithering, spinning, turning, twisting, pushing and pulling. Babies need to have daily ‘tummy time’ to develop their muscles for sitting and crawling.

Older children engage in weight bearing skills and develop upper arm strength, mobility, control and balance. This could be by hanging from climbing equipment or lifting and manipulating large, heavy and awkward objects.

You should notice what children are doing physically and make sure that what they can use indoors and outdoors is challenging enough. You need to know about each child’s physical development.

Children need to take safe risks. However, most children will self-regulate and not attempt movements that they are not confident with. 

Consider what equipment you have in your setting that support gross motor skills such as den making materials.  Try to have a variety of objects children can lift, transport and organise on their own. 

Try to help children to be physically active for at least 3 hours each day.

##Suggested activities 

###Moving house

You’ll need:

- ‘home’ toys like plates and cups
- children’s furniture that is safe to move like plastic chairs
- the furniture and resources in the home area
- cardboard boxes and bubble wrap
- sticky tape and masking tape
- clipboards and pens
- an improvised removal van

‘Moving House’ play supports the development of muscular strength, core strength, whole body coordination and the ability to carry objects safely.

Many children have moved from one home to another. Naturally, they want to roleplay this experience. Children may start ‘moving house’ themselves, which you can support. Or you may want to start the play.

Children will know where they want to move to. Prompt discussion about the type of home the children are moving from and to, for example a flat or a house? What kind of house?

Suggest that they check that they have a safe route and space to set up. They may need to discuss it with other children and adults.

Start with wrapping things up and putting them in boxes. The children will physically pick up and move the boxes and furniture, either to the new home or into the ‘removal van’. They’ll need support to ensure they do this safely, but they will want to get it right.

Have clipboards for making lists and checking that all possessions have arrived safely at the new house. These can be mark making or pictures.

###How this activity links to the other areas of learning

Wrapping the smaller objects will help their [fine motor skills](/physical-development/fine-motor-skills). Making lists will support [literacy](/literacy). Talking about people living in different types of accommodation links with [understanding the world](/understanding-the-world). Roleplaying a significant life event will help them to handle their [personal, social and emotional development](/personal-social-and-emotional-development) during a real move.

###Obstacle courses

You’ll need some items from this list of suggestions:

- crates
- wooden planks
- bread trays
- tunnels
- stepping stones (wood off-cuts)
- hoops
- cones
- rockers
- trampoline
- blankets
- slide
- tyres
- ladders

You can also include fixed climbing equipment, outdoor furniture, paths and natural features, such as tree stumps or fallen branches.

You may observe children finding their own obstacle course with what is already there, travelling in lines, going over, going under and going through. Children may repeat the route, challenging themselves and others.

Get them to help you build a course. They’ll try out different parts of the course as it is being built, testing that it works.

Once the obstacle course is constructed children will revisit it. Each time they will become increasingly skilful in negotiating the different spaces, pieces of equipment and the length of the course. They will also speed up and travel faster.

Some parts will feel like more of a risk than others and the children will enjoy this element of challenging themselves.

###How this activity links to the other areas of learning

Children will constantly communicate, non-verbally and verbally as they negotiate the course. They’ll instruct each other, expressing their emotions, and encouraging each other [(communication and language)](/communication-and-language). There are opportunities for you and the children to use mathematical language, words to describe quantity, size, length, speed, as well as to make comparisons [(mathematics)](/mathematics).

##Other activities

[Physical activity guidelines for children under 5](https://www.nhs.uk/live-well/exercise/physical-activity-guidelines-children-under-five-years/) years from the NHS.

[Learning through landscapes](https://www.ltl.org.uk/) has ideas for outdoors activities.

##What other nurseries and childminders are doing

^“Since Covid I have changed my provision so that everything is outside. It is working very well indeed. The children love it and they’re thriving in every way.”^

Julie, Childminder, Ilkley West Yorkshire.

^“The children spend a lot of time being adventurous outside. Not everyone has been confident with this, but now we have regular online team meetings and practitioner confidence has blossomed.”^

Mandy, Naturally Learning, Truro. 

^“Everyone comes on our walks. One destination is a particular hill in the park. Walking up the hill is a struggle for young children to start with but over time we see them running up.”^

Julie, Childminder, Ilkley West Yorkshire.

##Summary

- Gross motor skills are all the skills that children develop using their whole body.
- Children’s development of gross motor skills affects their learning and development.
- Children need access to outdoor areas every day.
- Children need to take safe risks and will usually not attempt movements that they’re not confident with.
- Try to help children to be physically active for at least 3 hours each day.

##Next steps 

- Involve parents and carers by sharing the children’s achievements in developing gross motor skills with them.
- Observe what the children are doing and notice movements that are more advanced, such as, twisting, slithering. 
- Consider how your routine and resources enable children to be physically active.
- Review your curriculum to ensure you cover the requirements in the EYFS for this area of learning.

$CTA

**Get alerts for new EYFS resources**

[Sign up to get emails when we add new early years foundation stage resources to this website](https://docs.google.com/forms/d/e/1FAIpQLSdZbPz-447CADTErT9eD1IU4yKfsEhyJy1C8U1fyFAQuEtejw/viewform?usp=sf_link)

$CTA', '2021-02-23 17:48:29.459165', '2022-09-06 13:26:23.768389', 21, 2, 23, 22, 't', 'Helen Rapp', 'Learn more about gross motor skills as part of the early years foundation stage (EYFS) including advice from experts and suggested activities.', '{:.contents-list__list}
* {:.contents-list__list-item .contents-list__list-item--dashed} [Why gross motor skills are important](#why-gross-motor-skills-are-important)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Video](#video)
* {:.contents-list__list-item .contents-list__list-item--dashed}[What the EYFS framework says](#what-the-eyfs-framework-says)
* {:.contents-list__list-item .contents-list__list-item--dashed}[What this means in practice](#what-this-means-in-practice)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Suggested activities](#suggested-activities)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Other activities](#other-activities)
* {:.contents-list__list-item .contents-list__list-item--dashed} [What other nurseries and childminders are doing](#what-other-nurseries-and-childminders-are-doing)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Summary](#summary) 
* {:.contents-list__list-item .contents-list__list-item--dashed} [Next steps](#next-steps)   ', 'Learn more about gross motor skills as part of the early years foundation stage (EYFS), including advice from experts and suggested activities.

'),
(25, 'Understanding the world', 'understanding-the-world', 'Access resources, activity ideas and advice for teaching understanding the world to early years children.

## Understanding the world resources

Resources are split into 3 areas based on the educational programmes: 

[Personal experiences](/understanding-the-world/personal-experiences)

[Diverse world](/understanding-the-world/diverse-world)

[Widening vocabulary](/understanding-the-world/widening-vocabulary)

These resources will help you when reviewing your current curriculum to make sure you are meeting the requirement of the revised understanding the world area of learning.  

As you make changes to your curriculum consider what you want children to learn first and plan opportunities for them to achieve this.

## What the early years foundation stage (EYFS) framework says about understanding the world
Understanding the world involves guiding children to make sense of their physical world and their community.

<details class="govuk-details">
<summary class="govuk-details__summary">
<span class="govuk-details__summary-text">
Read more
</span>
</summary>
<div class="govuk-details__text">

<p>The frequency and range of children’s personal experiences increases their knowledge and sense of the world around them – from visiting parks, libraries and museums to meeting important members of society such as police officers, nurses and firefighters.</p>

<p>In addition, listening to a broad selection of stories, non-fiction, rhymes and poems will foster their understanding of our culturally, socially, technologically and ecologically diverse world.</p>

<p>As well as building important knowledge, this extends their familiarity with words that support understanding across domains.</p>

<p>Enriching and widening children’s vocabulary will support later reading comprehension.</p>

</div>
</details>

$CTA

**Get alerts for new EYFS resources**

[Sign up to get emails when we add new early years foundation stage resources to this website](https://docs.google.com/forms/d/e/1FAIpQLSdZbPz-447CADTErT9eD1IU4yKfsEhyJy1C8U1fyFAQuEtejw/viewform?usp=sf_link)

$CTA', '2021-02-23 17:48:29.473902', '2021-12-17 15:29:15.680334', NULL, 6, 26, 16, 't', 'Helen Rapp', '', '', ''),
(26, 'Personal experiences', 'personal-experiences', '##Why personal experiences are important

When children begin to understand their personal experiences, through interaction with adults and other children, they begin to make sense of the world. 
 
Babies begin to develop a sense of self from birth and this is supported by how parents and carers respond and interact. Positive experiences and emotional attachments affect the baby’s development, in particular how they perceive themselves and how they relate to others.

Once a baby becomes mobile, the world starts to look very different. They start to use facial expressions and pointing to indicate their needs in addition to sounds like crying. Responsive adults will more often than not tune into these needs.

As a baby gets older, they have more opportunities to explore. You can accompany these explorations with gentle rhymes and songs. Babies can tune into the melodic line of storytelling, so finding stories that reflect their interests will help to enrich these early experiences.

Children communicating verbally start to build their vocabulary to describe their personal experiences.

Personal experiences contribute to children’s emerging sense of place, such where they live and other familiar places, and their sense of time. They begin to understand what happens over a day. They’re aware of morning, afternoon, evening and night time. 

##Video

In this video, an early years expert explains the importance of personal experiences in the early years foundation stage framework. There are also some tips on how to support children in this area.

$YoutubeVideo[EYFS - Understanding the world - Personal experiences](https://www.youtube.com/watch?v=WPpYr-wHjxQ&list=PL7914115EB65911A5&index=2)$EndYoutubeVideo

##What the EYFS framework says

The frequency and range of children’s personal experiences increases their knowledge and sense of the world around them – from visiting parks, libraries and museums to meeting important members of society such as police officers, nurses and firefighters.

[Statutory framework for the early years foundation stage](https://www.gov.uk/government/publications/early-years-foundation-stage-framework--2), page 8.

##What this means in practice

Talk to the child’s parent or carers and use what you have learned to inform planning. Acknowledge significant events in the child’s life. These may include holidays, visits to grandparents, family gatherings or special occasions.

Sadly, children may also experience family break-up or a death in the family. While heart-breaking and difficult to understand, children learn and develop from these life events.

Notice how babies and children respond to activities, events and objects and use this to inform your planning. Sometimes this might mean small changes, such as putting out a few party resources in the home area on special occasions.

At other times you may want to make larger changes, for example if one of the children is celebrating their birthday. In this case you could set up a birthday party, and encourage children to consider the differences between other birthdays they have experienced, for example between a parent or carer’s birthday and their own birthday. Talk to the children about special occasions that you have attended. Shared experiences enrich children’s understanding of the world. 

Going for walks helps to develop children’s sense of place and their understanding of their local area. As you walk with the children, talk about the things that they are seeing around them, such as gardens, woodland, plants, flowers, animals, vehicles and buildings. Children will gain knowledge of the natural world, which can be further enriched through learning back in the setting. This could include collections of natural materials, close observation of minibeasts such as the lifecycle of a butterfly, experimenting with ice, materials that float and sink, how wheeled toys move and how to make shadows using torches in dark spaces.

##Suggested activities

###Intergenerational projects

To build on young children’s personal experiences, engaging with their family is essential. There are many ways to do this, including daily informal interactions as well as planned events that occur over a calendar year, including birthday celebrations as well as family events. Many young children have more relatives that are grandparents and great grandparents (aunts and uncles too) than any previous generation. This community offers opportunities for intergenerational projects where children explore the world around them.
 
Research shows that communication with young children is beneficial for older people, so not only do the children benefit from these projects but they are uplifting for adults too.

Find out what skills grandparents and great grandparents have to offer the setting. These could include:

-   	cookery 
-   	craft skills
-   	computing 
-   	music making 
-   	storytelling, including storytelling in home languages
-   	gardening
-   	fixing cars
-   	building furniture
-   	decorating
-   	upcycling
-   	from their professional life, such as working or retired nurses, doctors, police officers or fire fighters

Plan these opportunities over the calendar year for different relatives to come into the setting and demonstrate their skills to the children. Plan for a range of exploratory experiences, including those with a scientific focus, such as where children explore changes to materials, observe the natural world or see how things work. Always accompany these activities with vocabulary to support children’s learning.

For safeguarding make sure a member of the team is always accompanying your visitor and that you follow all the procedures in your safeguarding policy.

Give time for your visitor to settle in. Choose an area that is most appropriate. For example:

- in the story area with a selection of fiction and non-fiction books that the visitor can share with children
-   	in the food preparation area
-   	in the art area, provide resources that match the visitor’s skills
-   	in the small world area with a focus on the appropriate small world toys
-   	outdoors
-   	role play area

Observe children’s interactions with the visitor and sensitively join in the dialogue as necessary. Ask ‘I wonder …’ questions.
 
Listen to children’s responses. Support the children by introducing new vocabulary.
 
Interaction between children and the adult can be quite natural and supported by the resources in the environment, for example books, small world play, outdoor provision.

For babies, hearing a grandparent gently singing has significance and impact.
 
Note children’s learning about the world around them. There are opportunities for the children to extend their social, cultural, scientific, ecological and technological knowledge and understanding. For example scientific learning is relevant to cooking, art, music making and gardening where children will observe change, the natural world and how things work. The ecological aspect of learning can be experienced through gardening and upcycling. Technology can be explored in computing, and everywhere there is a problem to solve and patterns to see.
 
Document the visit by taking photographs (with the appropriate permissions). These are a resource for recall and consolidation of children’s learning by capturing a personal experience they can come back to again and again.
 
Revisiting the visitors’ skills and dialogue will build up over time. These personal experiences will become embedded. The children’s understanding of the world is enriched and the vocabulary they use widened.
 
Following a visit from an older relative, note when children reference the visit in their play. Share this with the child’s family so that they can give feedback to their family member.

###How this activity links to the other areas of learning

A visit from an older relative creates a strong bond between the setting and family and nourishes the young child’s wellbeing ([personal, social and emotional development](/personal-social-and-emotional-development)). For those children whose relatives live further away and possibly in another country, to be with older people is important to explore a sense of time. Opportunities for non-verbal and verbal communication support young children’s language development ([communication and language](/communication-and-language)).

###I’m the baby!

You’ll need:

- a range of dolls, try to have girl and boy baby dolls and dolls of different ethnicities
- cots and beds
- clothes for the dolls
- bottles
- baby bath
- nappies
- baby products such as empty baby wash bottles or - baby food jars
- toys for babies
- books for babies
- scales for weighing the baby
- a toy pushchair or pram that’s safe for children to play with
- a bed that children can get into (optional)

Children often roleplay being a baby or being a parent. This can be prompted by the birth of a sibling, by seeing babies in your setting or because emotionally the child wishes that they were a baby again.

Have the materials for the activity available all the time so children can initiate play. 

Young children may imitate how a parent holds, feeds, changes and plays with a baby.

For older children, ask the baby’s name, then ask why that name, gently supporting the child to think about answering a ‘why’ question. This can lead to a discussion about the children’s own names. What do they sound like? Are they similar, or very different? Other interactions can be about the baby’s size, height, weight, whether the baby has grown out of their clothes or how much the baby has eaten. 

Children may roleplay the routine of washing, dressing, feeding, changing and going out with the baby. This helps them develop their sense of time and what happens first, next and after that.

A parent or carer may like to visit with their baby, as a special visitor. These experiences will enrich the child’s own play.

###How this activity links to the other areas of learning

To have the opportunity to be a baby again nourishes a child’s [personal, social and emotional development](/personal-social-and-emotional-development). The sense of having all your needs met by your mother can be very reassuring for young children [(emotions)](/personal-social-and-emotional-development/emotions). All roleplay is a stimulus for non-verbal and verbal [communication and language](/communication-and-language). Children may notice the labels on the baby products [(literacy)](/literacy). Interacting with children about their baby’s size, weight and height invites mathematical language to be used and developed [(mathematics)](/mathematics). Children may decide to have a ‘Naming the Baby’ party and make invitations [(expressive arts and design)](/expressive-arts-and-design). Dressing and undressing the baby helps children practice fine motor skills. 

##Other activities

[Babies - learning starts from the first day](https://www.early-education.org.uk/babies-learning-starts-first-day) from Early Education focuses on the very youngest children.

Practical ideas for how to support children in understanding their personal experiences from [Early Years Educator](https://www.earlyyearseducator.co.uk/search?q=Personal+experiences+).

##What other nurseries and childminders are doing

^“I wanted a way for my colleagues to engage with the children and their families that was celebratory and wouldn’t take too long to prepare. I had in mind encouraging children to talk about their personal experiences. If they are not at the stage of being able to talk, they can show that the photos are familiar through their facial expressions and enthusiastically pointing. I asked parents to email us their weekend experiences, these are printed off and laminated. The photographs are fantastic talking points for children and adults. The photographs are taken home and returned. They are wipeable, so extra safe.”^

Cathey, Nursery Manager, London

##Summary

- Children are able to start to make sense of the world by understanding their own personal experiences. Sharing these experiences with you and with their families or carers helps with this understanding.
- Personal experiences contribute to children’s emerging sense of place and time.
- Children build their vocabulary to describe their personal experiences and the world around them. 
- Through active participation in opportunities to explore, investigate and discover, children develop their knowledge of the natural and made world.
- Children learn more about places, what has happened over time and science by talking and sharing information with a supporting adult.


##Next steps

- Consider how the children are reflecting on their personal experiences. Can they tell you about local places they have visited? Can they recall when they visited? Can they sequence events? Are there prompts in the setting to support children’s talk when re-telling events? 
- Note when children can talk about their journey to the setting and to other places they visit often. 
- Check that children are using talk to show their knowledge of the world, including about the local area and the wider world. Listen to the vocabulary they use to describe, inform, predict and recall. 
- Help children to develop their knowledge and sense of the world by talking with them about what they have seen and what interests them, such as buildings, television programmes, vehicles or food. Also, family events and celebrations, the weather, seasons and what it means to grow up from being a baby. Provide non-fiction and story books to expand and enrich children’s understanding of the world, for example books about places to visit, professions and families.

$CTA

**Get alerts for new EYFS resources**

[Sign up to get emails when we add new early years foundation stage resources to this website](https://docs.google.com/forms/d/e/1FAIpQLSdZbPz-447CADTErT9eD1IU4yKfsEhyJy1C8U1fyFAQuEtejw/viewform?usp=sf_link)

$CTA


', '2021-02-23 17:48:29.487928', '2022-09-06 13:30:44.903683', 25, 1, 27, 25, 't', 'Helen Rapp', 'Learn more about personal experiences as part of the early years foundation stage (EYFS) including advice from experts and suggested activities.', '{:.contents-list__list}
* {:.contents-list__list-item .contents-list__list-item--dashed} [Why personal experiences are important](#why-personal-experiences-are-important)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Video](#video)
* {:.contents-list__list-item .contents-list__list-item--dashed}[What the EYFS framework says](#what-the-eyfs-framework-says)
* {:.contents-list__list-item .contents-list__list-item--dashed}[What this means in practice](#what-this-means-in-practice)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Suggested activities](#suggested-activities)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Other activities](#other-activities)
* {:.contents-list__list-item .contents-list__list-item--dashed} [What other nurseries and childminders are doing](#what-other-nurseries-and-childminders-are-doing)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Summary](#summary) 
* {:.contents-list__list-item .contents-list__list-item--dashed} [Next steps](#next-steps)   ', 'Learn more about personal experiences as part of the early years foundation stage (EYFS), including advice from experts and suggested activities.');
INSERT INTO "public"."content_pages" ("id", "title", "slug", "markdown", "created_at", "updated_at", "parent_id", "position", "next_id", "previous_id", "is_published", "author", "description", "content_list", "intro") VALUES
(27, 'Diverse world', 'diverse-world', '##Why diverse world is important

Diversity describes differences in age, culture, family structures, disabilities, ethnicity, gender, religion and sexual orientation. Understanding of a diverse world also includes understanding technological and ecological diversity.

There’s diversity in all communities. The more experience children have of being out and about in their community the more they are able to understand their community and make a contribution.
 
Having an idea of who they are as a child, within a family, leads naturally to being curious about everyone else. Starting in a setting or belonging to a childminder’s family, children begin to sense other relationships outside their own family.
 
From an early age children have formed attitudes towards children different from themselves. Support children to be curious about people around them, to see and understand similarities and differences. In this way children will be curious and respectful about others and become a positive member of a diverse world.
 
Children need to be able to form positive relationships, especially with other people who do things differently to themselves and their family. Children’s natural curiosity needs to be nurtured, nourished and extended to include their friends in the setting.
 
The diverse world should be integral to everyday practice, as well as the celebrations of religious days, visitors and visits. Make sure your setting reflects the diverse world. For example, you can look at musical instruments you have and find out where they originate from. In this way knowledge is built up that can be used incidentally with the children. 

Developing a child’s understanding of a diverse world builds their knowledge of the world, about families, seasons and days of the week, places, days gone by, natural habitats and the built environment. Their knowledge of the world is enriched with non-fiction and story books and a growing repertoire of songs, rhymes and poetry. 

Over time children become aware of the impact people have on the environment. Examples include understanding that it is important to care for small creatures, not to drop litter, the value of growing your own food, to reuse, recycle, reduce and repurpose. 

Young children learn that they can make informed choices and selections. This helps them to engage in the world in a positive way.
To further enrich the child’s knowledge and sense of the world, help them to learn about the natural and built environments around them. Talk to young children about ecological diversity in terms of differences and similarities in:

- animal habitats, including sea life, birds and minibeasts
-   	weather
-   	the seasons
-   	the countryside such as farms, fields, woods, moorland and seaside
-   	urban areas including towns and cities
-   	places in the world, such as, forest, woodland, desert, jungle and oceans
-   	built environments, types of buildings, different homes, roads and waterways

Diversity in technology can be defined in different ways, think about who has access to technological devices at home and in the setting. It’s important to make sure all children are supported to become more technologically aware in the world around them. Talk about what is used in the home, in shops, including the use of mobile phones, tablets and computers. 

The focus in the early years is on active learning, however, if children have no or little access to technological devices at home, it’s important to include provision in the setting for them. Children love to be involved in audio and video recording and taking photographs. Young children start to learn how to keep themselves safe, so always ask children if they are okay with having their photographs taken. They will learn to ask permission of others.

##Video

In this video, an early years expert explains the importance of the diverse world in the early years foundation stage framework. There are also some tips on how to support children in this area.

$YoutubeVideo[EYFS - Understanding the world - Diverse world](https://www.youtube.com/watch?v=JQVWWjTFca8&list=PL7914115EB65911A5&index=3)$EndYoutubeVideo

##What the EYFS framework says

Listening to a broad selection of stories, non-fiction, rhymes and poems will foster their understanding of our culturally, socially, technologically and ecologically diverse
world. As well as building important knowledge, this extends their familiarity with
words that support understanding across domains.

[Statutory framework for the early years foundation stage](https://www.gov.uk/government/publications/early-years-foundation-stage-framework--2). Page 10

##What this means in practice

When you’re confident in your own principles and values around diversity, you can ask genuine questions about families who are different to your own. In this way you’re demonstrating to the children and their families that everyone needs to have a genuine interest in others. Your interests may be about a parent or carer’s job, or a specialist skill, or heritage. If a child lives between 2 different homes, offer support to both parents or carers.
 
Recognise that one community that is represented, for example, by one religion is a complex entity. Not everyone in one community acts the same. Therefore, making an assumption about a person because of their difference is unhealthy.
 
Having people visit, or going out on trips helps develop yours and the children’s ideas about the diverse world. Both need to be planned carefully. Consider the relevance of ecological diversity (natural and made environments) and technological diversity (seeing examples of technology in the environment) when planning visits.

Children, including babies, benefit from visitors. When professionals visit regularly, such as police officers, fire fighters, doctors or nurses, they become familiar people to the children. Children gain confidence to ask questions and listen actively.

##Suggested activities 

###A Diwali celebration

Diwali, the festival of lights, is celebrated by Hindu, Sikh, Jain and some Buddhist communities. Hindu, Sikh, Jain and Buddhist families participate in the 5 day festival during the autumn, check online calendars for dates each year.

It’s important in settings where the Hindu, Sikh, Jain and Buddhist communities are not represented to celebrate Diwali because of its significance in Britain’s diverse cultures. When an event is not a direct experience for most of the children, it needs to be made as real and meaningful as possible by you.

Families celebrating Diwali will be creating Rangoli Patterns on their doorsteps, using chalk, exchanging gifts and Diwali cards, and eating specially prepared food. There are street lights, lighting Diva lights at home, as well as fireworks.

In your setting or childminder’s home, enrich the environment to reflect elements of the Diwali festival, for example:

- watch and play alongside the children and provide them with more information about the Diwali festival
- use images and short films available from [BBC Bitesize](https://www.bbc.co.uk/bitesize/topics/zh86n39/articles/zjpp92p) and [CBeebies](https://www.bbc.co.uk/cbeebies/watch/lets-celebrate-diwali)
- have a selection of information and story books available, accessible to the children and read to them when they show an interest, simplifying the text if necessary

Inform the children’s families of the 5 day long Diwali festival. They may have resources they can bring in such as, Indian artefacts like puppets, elephant ornaments or clothing.

You may want to hold back some parts of the activity like the cooking, until maybe, day 3 or 4.

On day 5, have a Diwali celebration, play Indian music, eat Indian food and provide music for dancing inside and out.

A popular Indian dance is the dance with sticks or Ludi. Show the children a film of a Ludi dance, readily available on YouTube. Children will enjoy making up their own Ludi dance. Check with the parents to see if anyone could demonstrate the dance for you. Note that the Ludi Dance is also performed at the Muslim Eid (Eid ul fitr and Eid ul adha) and wedding celebrations.

###How this activity links with the other areas of learning

For a child to have their family’s religious festival recognised is deeply personal and enriching. For children who are unfamiliar with Diwali their social understanding is developed, knowing what happens for other children [(personal, social and emotional development)](/personal-social-and-emotional-development). The Diwali celebrations will stimulate interaction between adults and children [(communication and language)](/communication-and-language). Opportunities for children to manipulate different materials like clay, paint, paper, scissors, will develop their fine motor skills, which contributes to later mark making and writing. [physical development](/physical-development) and [literacy](/literacy).  

###Visit to a local supermarket or corner shop

Family life has changed dramatically, and some children will not have experienced shopping at all. Local supermarkets, whether they are the equivalent to a ‘corner shop’ or are on a larger scale, offer a range of possibilities for supporting children’s understanding of diverse worlds. There are opportunities to develop children’s understanding of cultural, social, technological and ecological diversity.
 
The more frequently these visits are planned the more children will understand what it means to go shopping. Shopping with the family is a different experience and the children will benefit from you talking them through the experience.

Before the visit:

- formally arrange the visit so that you are expected
- plan to take as small group as is possible and visit several times, rather than trying to take everyone at once
- visit the shop, with a colleague, before you take the children so that you know what to expect
- inform the shop manager or owner that the children are very young and let them know if the group includes babies
- complete a risk assessment and share it with every adult who is going on the visit
- try to anticipate what might happen so that you are well prepared
- take a first aid kit, as you would do for all walks outside of your setting or childminder home
- if you need to travel on public transport, make this a part of the visit, it will offer much to support the diverse world and many other aspects of a child’s learning and development
- make a shopping list with the children, make it purposeful, for example: 
    - a range of fruits (maybe the fruits for Handa’s Surprise)  
    - a selection of vegetables (the vegetables for Oliver’s Vegetables) 
    - cooking ingredients, for example for dough, a birthday cake, daal, soup, a favourite family recipe
- if you are visiting a supermarket it may be best to visit just one section 

On the way to the shop or supermarket, listen to the children and respond to any of their questions, concerns, needs.
On arrival, explain to the children that this is potentially a busy place and so we need to be aware of everyone around us.

Some supermarkets provide child-sized trollies to use if you can.
 
Support all the children to be actively involved and have a role. Who is going to look after the shopping list and tick off each item? (Have a mini-sized clipboard), who is going to take items off the shelf? Who is going to look after the money? 

Show the children where machines and devices are used. Give time for the children to observe while you describe what is happening. For example, when looking at the weighing scales in the fruit and vegetable section, ask, ‘I wonder what this machine is for?’ 

Note the countries of origin. Some older children may have travelled abroad and can recall the experience. If they have been to Spain, it is likely that there will be fruit imported from Spain. If they or their family members have visited the Caribbean, show them the sweet potatoes. You could buy different types of potatoes to explore back at the setting.

If they or their relatives have been to either the Caribbean, Hong Kong, China, Pakistan, India or Bangladesh, show them coriander, chillies, ginger, garlic, aubergines and okra and rice, ingredients for Chinese cookery. You could cook a stir fry back at the setting.

With older children, think about how far the food has been transported to reach the supermarket. How has the food been transported? When returning to the setting see how many different trucks can be spotted that are transporting foodstuffs. These discussions will deepen children’s ecological awareness of the impact of food transport on the environment. 

Take photographs of the children.

For some children, the shop or supermarket will be familiar to them. Let them tell their story and show others around.

You will know when the children are ready to leave and walk back to the setting or childminder’s home. 

A supermarket visit could also have a science focus. Focus on how food is grown. Purchase onions, garlic and ginger to find how long before green shoots appear and then they can be planted either in the setting garden or in indoor pots. Root vegetables such as potatoes and carrots also sprout when left.

Buy the ingredients for tactile play and kitchen science experiments, such as cream of tartar, baking soda and vinegar, ingredients for bread or cream for making butter.

Explore different packaging and look at the materials used, are they fit for purpose?

Buy white flowers to take back to the setting and add ink to the water to observe the water move through their stems, the capillary action. 

Go to the fish counter and choose a fish for the children to examine closely back in the setting. This needs to be done with the guidance of an adult. Children could learn to name the parts of the fish and experience touching the scales. 

###How this activity links to the other areas of learning

Visits out of the setting or the childminder’s home offer rich opportunities for develop children’s talking and listening ([communication and language](/communication-and-language)).  Visits are physically demanding for very young children, using their whole bodies to walk, get onto and off a bus or train and building their stamina ([physical development](/physical-development)). Young children may be familiar with self-check-out and the use of cards to pay ([expressive arts and design](/expressive-arts-and-design)). Having real money will be a new experience for many children ([mathematics](/mathematics)).

##Other activities 

Over the period of a year, plan for as many different visitors as possible to come into the setting, but also for the children to visit their place of work.

Visits to cafes that offer foods from different parts of the world.

Invite performers into the setting who sing and play music from around the world (make sure you carry out the appropriate checks).

Ideas for how to bring [cultural diversity into the early years](https://www.communityplaythings.co.uk/learning-library/articles/cultural-diversity-in-the-early-years). 

##What other nurseries and childminders are doing

^“Everyone knows us in the community because we are out there going for walks, throughout the year. It’s good for the children and it’s good for the outside world to see them.”^
 
Julie, childminder, Ilkley.

^“We ask families for some holiday photographs, which we print off, laminate and use as a resource. These resources spark lots of talk between the adult and children as well as between the children themselves.”^

Cathey, Nursery Manager, London

^“This Christmas we asked every family to bring one tree ornament for the Christmas tree. It was wonderful. We had decorations from all over the world and every child knew which one was theirs.”^

Mandy, Naturally Learning, Truro.

##Summary 

- Diversity describes differences in age, culture, disabilities, ethnicity, gender, religion and sexual orientation.
- In Britain, there is diversity in all local communities.
- From a very early age children have formulated attitudes towards other children and families different from their own.
- Make sure your setting reflects the diversity in Britain and includes frequent visits out into the community and welcomes visitors into the setting.
- Making sure that adults in the setting respect diversity supports children to develop their understanding of a diverse world.
- A child’s understanding of diversity in the world develops as they learn about the natural and built environments around them, as well as what they learn about the wider world.
- Children need to be supported to become technologically aware in the setting and on visits. They need to learn to keep themselves safe.


##Next steps

- Think about your knowledge and understanding of the diverse world. Consider where you are most confident and where you know your knowledge is less secure. Research these areas.
- Consider if your setting reflects a diverse world. Check your resources for diversity. For example, do dolls and small world figures reflect the diverse world.
- Try singing songs in different languages. Set yourself the challenge of learning a ‘hello’ song in as many different languages as possible.
- Check your books to make sure they reflect a diverse world. Identify any gaps and start to fill these. Include self-made books that reflect the diversity of the local community.
- Plan some visits over the year, to make sure there is a variety as well as going back to places that are popular with the children.
- Review your curriculum to ensure you cover the requirements in the EYFS for this area of learning.

$CTA

**Get alerts for new EYFS resources**

[Sign up to get emails when we add new early years foundation stage resources to this website](https://docs.google.com/forms/d/e/1FAIpQLSdZbPz-447CADTErT9eD1IU4yKfsEhyJy1C8U1fyFAQuEtejw/viewform?usp=sf_link)

$CTA', '2021-02-23 17:48:29.503154', '2022-09-06 13:30:54.959517', 25, 2, 28, 26, 't', 'Helen Rapp', 'Learn more about the diverse world as part of the early years foundation stage (EYFS) including advice from experts and suggested activities.', '{:.contents-list__list}
* {:.contents-list__list-item .contents-list__list-item--dashed} [Why diverse world is important](#why-diverse-world-is-important)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Video](#video)
* {:.contents-list__list-item .contents-list__list-item--dashed}[What the EYFS framework says](#what-the-eyfs-framework-says)
* {:.contents-list__list-item .contents-list__list-item--dashed}[What this means in practice](#what-this-means-in-practice)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Suggested activities](#suggested-activities)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Other activities](#other-activities)
* {:.contents-list__list-item .contents-list__list-item--dashed} [What other nurseries and childminders are doing](#what-other-nurseries-and-childminders-are-doing)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Summary](#summary) 
* {:.contents-list__list-item .contents-list__list-item--dashed} [Next steps](#next-steps)   ', 'Learn more about the diverse world as part of the early years foundation stage (EYFS), including advice from experts and suggested activities.

'),
(28, 'Widening vocabulary', 'widening-vocabulary', '##Why widening vocabulary is important

Babies are constantly showing that they want to communicate as they respond to different types of stimulation.
 
You should work to enrich all children’s vocabulary whatever their starting point. Whether young infants or children with additional needs or children with English as an additional language. 

You should describe experiences using the correct vocabulary, playing alongside children. Encourage and support children with their first attempts to use wider vocabulary.
 
You could describe aspects of the social, cultural, ecological and technological areas of learning as a way of demonstrating new vocabulary to the children. In the diverse world section we discuss the social and cultural aspects of life and learning. There are opportunities for new vocabulary here.

Technological aspects of life and learning include devices like mobile phones, tablets, TVs, computers, cash machines, supermarket check-outs and cameras. Babies and children observe how adults use these and this helps widen their vocabulary.

Ecological aspects of life and learning include children’s attention to resources being recycled, reused, reduced and repurposed.
 
Both technological and ecological aspects of life and learning include confidence in science. Children will start to learn scientific ideas as they take part in exploratory play with natural materials, gardening, musical instruments, cooking experiences, art materials and outdoors, where children have direct experience of the weather and the seasons.
 
Having books and images in your setting that support all these interests and aspects of understanding the world support children to gain their early literacy skills.

Understanding the world presents the young child with a vast range of language and literacy possibilities. 

##Video

In this video, an early years expert explains the importance of widening vocabulary in the early years foundation stage framework. There are also some tips on how to support children in this area.

$YoutubeVideo[EYFS - Understanding the world - Widening vocabulary](https://www.youtube.com/watch?v=-gFjiyBHZo4&list=PL7914115EB65911A5&index=1)$EndYoutubeVideo

##What the EYFS framework says

Enriching and widening children’s vocabulary will support later reading comprehension. 

[Statutory framework for the early years foundation stage](https://www.gov.uk/government/publications/early-years-foundation-stage-framework--2), page 10.

##What this means in practice

Enriching and widening vocabulary, within the context of understanding the world, should happen daily. Talk is a key resource and is relevant for all children, from the very youngest, to those who will soon transition to reception.
 
Creating a culture of trust and striving for some consistency in language without losing diversity, is an on-going process.
 
To encourage social and cultural inclusivity, make sure you use the correct words to describe religions, languages spoken, pronunciation of names and special events.
 
Enhance ecological awareness by using words to describe changes within the natural world, including animals, plants, flowers, trees and birds. The seasons are a natural resource for children to observe, feel and experience the weather.
 
To develop an understanding of the technological world use words to describe the technological devices babies and children experience. 

Children are aware of the technological world as babies. They see TV, tablets, mobile phones and laptop screens from birth. You need to acknowledge technology by playing alongside children and be actively engaged in their learning. These are important observations to see how knowledgeable children are, for example pretending a wooden block is a mobile phone.

##Suggested activities

###Make a collection

It’s important for children to begin to understand the concept of the past.  They can do this by making links with their personal experiences and knowledge. Collecting artefacts on a theme works very well and motivates plenty of talk and thinking about the past. There is an important link with technology and how things work. Charity shops are a great source for items.

Examples of collections include:

- toys: this might be toys in general or maybe choose teddy bears, vehicles, dolls, construction toys or clockwork toys
- kitchen utensils: spoons and mixing bowls, wooden, ceramic, plastic, melamine and stainless steel
- cameras: box cameras, SLRs, instamatics, digital or mobiles; accompanying photographs strengthen the historical focus
- computers for technology corner

For this plan the focus is on cameras and photographs.

Arrange a display of cameras and photographs from the earliest you can find to the latest. Make sure you are happy for the children to handle them. If you can find photographs to match the cameras even better.
 
Observe how the children approach the display. Can they make the connection between the photographs and the different cameras? Some children will be curious about the mechanisms and how the cameras work, others will be fascinated by the differences in the photographs. What do they tell you? 
 
Interact with the children as they explore. Introduce language about how old each camera is, relating to the ages of people they are familiar with. ‘Here’s a camera like the one my parents used.’
 
Widen vocabulary by using words to describe how the cameras work, the different parts of the cameras, whether they are old, not so old, modern, new. Use language that describes time, such as, the past, a long time ago; recent, when you were a baby.
 
For very young children make collections that are very safe to handle if a child puts the objects in their mouth.

Build on a child’s natural curiosity and choose a collection that you know they are interested in. 

###How this activity links to the other areas of learning

The focus is on the children questioning, describing, and widening their vocabulary of time, as well as technological vocabulary ([communication and language](/communication-and-language)). Handling the objects develops the children’s fine motor skills ([physical development](/physical-development)). Plenty of mathematical language will be used to describe shape, quantity, size and age, comparative words such as older than, oldest, new and newest ([mathematics](/mathematics)).


###Create a recycling plant

Ask parents and carers to donate things to be recycled, for example:

- old clothes
- handbags, purses, shoes or other accessories
- old jewellery
- boxes and containers
- different types of paper, including wrapping paper, wallpaper
- rope, string, twine
- buttons

The children could also collect:

- sticks
- pebbles
- shells
- dry leaves
- crates for sorting

Check all the resources before you start to ensure everything is suitable and clean.

Find an area to become the ‘recycling centre’. You can make a big sign so that everyone is aware of the recycling project. If you have a lot of donations you can set up your recycling centre outside.

This activity will allow you to promote the ecological language around recycling:

- recycle, changing a material into something new, like paper
- reuse, using something over and over again, like a bag
- reduce, minimising how much of a material you use, like reducing plastic
- repurpose, using a material for a different function, for example a plastic bottle filled to be made heavy becomes a toy baby

Explain to the children that you have received lots of different materials that need to be sorted, and maybe they would like to help.

Together with the children look at what you have and start to decide how everything could be sorted into the crates.

Some children may be willing to either draw or mark make and label the crates so that everyone knows where everything should go.

As the children sort, notice what the children are interested in, if they either find a use for a resource and want to do that straight away, or make suggestions about where materials can go in the setting, let them. Some children will have a model in mind, others will want to add to their kitchen, musical instruments, or create a prop for role play.

On another day, try using magnets and introduce sorting for wood and metal materials, metallic and non-metallic.

The recycling centre can become a permanent fixture and added to daily or weekly. Some children will want to oversee this regularly and claim ownership.

###How this activity links to the other areas of learning

Thinking about and actively recycling links with children’s social development and their developing sense of community [(personal, social and emotional development)](/personal-social-and-emotional-development). For older and more articulate children there are opportunities to introduce the ecological language about the recycling, reusing, reducing and repurposing [(communication and language)](/communication-and-language). The children use their fine motor skills and coordination when sorting. With larger objects, they’re using their gross motor skills and muscular strength [(physical development)](/physical-development).

##Other activities

Look for local workplaces that focus on technology and arrange a visit. For example a cybercafe.

Local recycling organisations are eager to be involved with community settings. A great resource for recycled materials.

[Ideas on computing and appropriate programs](https://homerton.cambs.sch.uk/information-for-practioners/ict-in-the-early-years/) for very young children.

The website for [Eureka! The National Children’s Museum](https://www.eureka.org.uk/eureka-at-home/) has many inspiring images.

##What other nurseries and childminders are doing

^“We focus on giving the children the vocabulary in the ‘real’ word. So, in the children’s play we include the vocabulary we want to introduce. Recently we have focused on volcanoes, the interest came from the children. You have to research the subject.”^

Mandy, Naturally Learning, Truro.

^“Our allotment is a place where all the children can be free and active outside.”^

Julie, childminder, Ilkley.

^“Our families are bilingual and trilingual, so we work hard to understand which language is spoken by which family member. It’s important we get it right.”^

Cathey, Bright Horizons, Harrow.

##Summary 

- Understanding the world presents the young child with a wide range of language and literacy possibilities.
- When you describe experiences using the correct vocabulary children can learn new words.
- You could describe social, cultural, ecological and technological areas of learning demonstrating new vocabulary to the children.
- You could create a trusting atmosphere where the children can support each other with technical language.

##Next steps

- Have a team discussion, or reflect with a colleague or another childminder, on all the aspects of daily life that reflect modern technology. Then see how this is evident in babies’ and children’s play.
- Look at the books you have to see if any reflect the modern technological world. You may want to make a book with the older children, this can be from their perspective.
- Review your curriculum to ensure you cover the requirements in the EYFS for this area of learning.

$CTA

**Get alerts for new EYFS resources**

[Sign up to get emails when we add new early years foundation stage resources to this website](https://docs.google.com/forms/d/e/1FAIpQLSdZbPz-447CADTErT9eD1IU4yKfsEhyJy1C8U1fyFAQuEtejw/viewform?usp=sf_link)

$CTA

', '2021-02-23 17:48:29.51767', '2022-09-06 13:31:06.380633', 25, 3, 5, 27, 't', 'Helen Rapp', 'Learn more about widening vocabulary as part of the early years foundation stage (EYFS) including advice from experts and suggested activities.', '{:.contents-list__list}
* {:.contents-list__list-item .contents-list__list-item--dashed} [Why widening vocabulary is important](#why-widening-vocabulary-is-important)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Video](#video)
* {:.contents-list__list-item .contents-list__list-item--dashed}[What the EYFS framework says](#what-the-eyfs-framework-says)
* {:.contents-list__list-item .contents-list__list-item--dashed}[What this means in practice](#what-this-means-in-practice)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Suggested activities](#suggested-activities)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Other activities](#other-activities)
* {:.contents-list__list-item .contents-list__list-item--dashed} [What other nurseries and childminders are doing](#what-other-nurseries-and-childminders-are-doing)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Summary](#summary) 
* {:.contents-list__list-item .contents-list__list-item--dashed} [Next steps](#next-steps)   ', 'Learn more about widening vocabulary as part of the early years foundation stage (EYFS), including advice from experts and suggested activities.'),
(31, 'Get help to improve your practice', 'get-help-to-improve-your-practice', 'Access resources and advice to help improve practice in the early years.

[Curriculum planning](/get-help-to-improve-your-practice/curriculum-planning)

[Reducing paperwork](/get-help-to-improve-your-practice/reducing-paperwork)

[Working in partnership with parents and carers](/get-help-to-improve-your-practice/working-in-partnership-with-parents-and-carers)

[English as an additional language (EAL)](/get-help-to-improve-your-practice/english-as-an-additional-language-eal)

[Meeting the needs of all children](/get-help-to-improve-your-practice/meeting-the-needs-of-all-children)

[Sensory food education](/get-help-to-improve-your-practice/sensory-food-education)

[Integrated reviews](/get-help-to-improve-your-practice/integrated-reviews)

[Early years practitioner wellbeing support](/get-help-to-improve-your-practice/early-years-practitioner-wellbeing-support)

$CTA

**Get alerts for new EYFS resources**

[Sign up to get emails when we add new early years foundation stage resources to this website](https://docs.google.com/forms/d/e/1FAIpQLSdZbPz-447CADTErT9eD1IU4yKfsEhyJy1C8U1fyFAQuEtejw/viewform?usp=sf_link)

$CTA', '2021-03-19 17:28:12.002156', '2023-11-06 15:55:52.604736', NULL, 9, 32, 8, 't', 'Michaela Chirgwin', '', '', ''),
(32, 'Curriculum planning', 'curriculum-planning', 'Find out more about how curriculum planning helps give the children a better experience, covering all early years foundation stage (EYFS) areas of learning.

##What is a curriculum?

A curriculum is what you want the children to learn in the time they are with you. 

It must be based on the statutory [early years foundation stage (EYFS)](https://www.gov.uk/government/publications/early-years-foundation-stage-framework--2), which gives you a framework that you can build on, through the 7 areas of learning. 

You can decide how best to deliver those areas by creating a curriculum unique to your setting, providing activities and experiences that deliver those areas of learning.

##Planning your curriculum

You should always start with the [early years foundation stage (EYFS) framework](https://www.gov.uk/government/publications/early-years-foundation-stage-framework--2). It contains educational programmes that sit under 7 areas of learning. These are high-level curriculum summaries that you must follow and work into a rich curriculum that meets the needs of the children.

From there, break down those high-level curriculum summaries into smaller steps. Decide what you want children to learn, the activities you want to do with them and how your setting can support their learning.

Childminders or nursery leaders (working with their staff) should decide how to implement these activities and experiences, so the children can progress in all the areas of learning. You should evaluate how well the curriculum works, checking what children know and can do as they move through the EYFS.

You should consider using [‘Development Matters’](https://www.gov.uk/government/publications/development-matters--2) the non-statutory curriculum guidance for the early years foundation stage to support you in planning your curriculum.

Your curriculum should be unique to your setting. Watch your children, studying how they lead their own play. Talk to parents and carers to find out their interests. Listening to what children say also provides clues about their curiosities and interests.

Use this knowledge to decide how best to engage children in the curriculum, choosing the right activity or environment. It should not be overly complicated and should meet the needs of the majority of children. Some children, such as those with SEND, may need additional support.

It’s important not to use the early learning goals (ELGs) from the EYFS as the basis for your curriculum. They should only be used as an assessment during the summer term of the reception year.

##Summary

- Consider what you want children to learn then plan the activity. 
- Base your curriculum on your children, covering the 7 areas of learning in the EYFS, using the statutory educational programmes (high-level curriculum summaries) as a starting point.
- The new EYFS framework is more specific, and better suited to be used as a basis for curriculum planning. 
- Consider using Development Matters to help you plan your curriculum.
- Do not use the ELGs as a curriculum starting point. They should only be used as an assessment during the summer term at the end of the reception year.

$CTA

**Get alerts for new EYFS resources**

[Sign up to get emails when we add new early years foundation stage resources to this website](https://docs.google.com/forms/d/e/1FAIpQLSdZbPz-447CADTErT9eD1IU4yKfsEhyJy1C8U1fyFAQuEtejw/viewform?usp=sf_link)

$CTA', '2021-03-20 11:42:40.280179', '2021-12-17 15:37:28.834238', 31, 1, 35, 31, 't', 'Helen Rapp', '', '', ''),
(35, 'Reducing paperwork', 'reducing-paperwork', 'Find out about reducing the amount of paperwork you do, including what Ofsted will look for during inspections.

Reducing unnecessary paperwork is a key aim of the new early years foundation stage (EYFS) framework. This is so you can spend more time engaging with children.

##What Ofsted will look for during inspections

Ofsted know that children learn best from high-quality interactions with adults. Ofsted do not want the assessment of young children to take you away from this important work. 
Rather than looking at information about children, inspectors will want to discuss the progress that children are making with you. Inspectors will want to discuss:

- what the children could do when they arrived
- what they are working on now
- what you want them to learn or be able to do by the time they leave

Inspectors will **not** expect this information to be recorded in any particular way. You can choose to record it in the way that works best for you. 
For example, a small setting may know their children so well that they can provide a verbal account of children’s current learning and progress. A larger setting might decide to keep records if they wish.

##Assessing children''s progress 

Gather useful information, rather than producing lots of tracking data and documentation, or following checklists.

In ‘Development Matters’, the non-statutory curriculum guidance, there are ‘checkpoints’ rather than ‘checklists’. You can use the checkpoints to reflect on children’s development in the three prime areas. They’ll help you understand what children are doing well, and where they may need more support. The prime areas ensure a strong foundation for children''s development. 

Understand the children currently at your setting, and the starting points for new children. Use conversations, observations, reflections and your professional knowledge to assess your children and their learning. This ongoing, formative assessment helps you make informed decisions about how to support children’s learning, as part of their wider development. 

Ask parents and carers about their child’s interests, to find out what they’re curious about. Ask children to tell you about their learning or observe them if they are not able to tell you.

Share information with parents and carers, which will help you gain further insights. Share information with children in an appropriate way, allowing them to reflect. Support them to be aware of their own learning.

$CTA

**Get alerts for new EYFS resources**

[Sign up to get emails when we add new early years foundation stage resources to this website](https://docs.google.com/forms/d/e/1FAIpQLSdZbPz-447CADTErT9eD1IU4yKfsEhyJy1C8U1fyFAQuEtejw/viewform?usp=sf_link)

$CTA', '2021-03-20 11:58:55.632043', '2021-12-17 15:37:53.357586', 31, 2, 37, 32, 't', 'Helen Rapp', '', '', ''),
(37, 'Working in partnership with parents and carers', 'working-in-partnership-with-parents-and-carers', 'Find out why working with parents is so important and how to do this well.


##The benefits of good relationships with parents and carers

Research shows that involving parents and carers in their children’s learning is the most important factor in enabling some children to do well regardless of background. 

Working in partnership with parents and carers is central to the early years foundation stage (EYFS). The relationship might begin with them visiting your setting. This will help inform you how to sensitively settle the child. 

Put them first by inviting them to share all they can about themselves. Find out about their family and community culture, and personal histories. Ask about what they expect from you as a childminder or your nursery. Value parents and carers as children’s first educators. Give them the opportunity to contribute to the whole of their child’s journey at your setting. 

Invite parents and carers to be with you if possible as you settle their child. They can then trust in the way you respond to their child and see how you personalise their child’s learning. It’s about working together to share knowledge, understand children’s interests and discover how best to support their learning.

##Communicating with parents and carers

Offering a range of opportunities for parents and carers to become involved in their children’s learning is important. Consider how you will overcome any barriers they may have to working in partnership. For example, their own experiences of nursery, separation, language, culture and different values. 

Other ways to involve parents can include:

- daily chats with key persons 
- time for the  child to settle in
- viewing film of their child so they can continue their child’s learning at home 
- attending a workshop on different areas of learning 
- going on trips with you 
- home visits
- volunteering
- phone calls home
- community projects
- documenting their personal histories
- being parent governors or steering group members

##Sharing information

Parents and carers want to be involved in their children’s learning. They will often ask for information to be shared with them. They like to see videos or photos of their child too.

If you’re sharing information use it as an opportunity to set up a two-way dialogue with parents and carers about their child’s learning. You could share observations of the child learning something new in nursery. Exchange observations with parents and carers of their child deeply involved at home. For example, if a child becomes interested in lining things up in the nursery then this could indicate an interest in number or positioning. To share this information with parents enables them to offer something similar in the home environment which will further the child’s development and learning. 

However, sharing information should not become a tracking exercise and you should not let this lead to creating unnecessary paperwork.

$CTA

**Get alerts for new EYFS resources**

[Sign up to get emails when we add new early years foundation stage resources to this website](https://docs.google.com/forms/d/e/1FAIpQLSdZbPz-447CADTErT9eD1IU4yKfsEhyJy1C8U1fyFAQuEtejw/viewform?usp=sf_link)

$CTA', '2021-03-20 12:15:42.467953', '2021-12-17 15:38:22.04424', 31, 5, 38, 35, 't', 'Helen Rapp', '', '', ''),
(38, 'English as an additional language (EAL)', 'english-as-an-additional-language-eal', 'Learn how to support children who have an additional language. Including information on speaking with children, modelling clear concise English and working with parents.

English society is multilingual, with an estimated 360 languages spoken across the country. 

##Advantages of being multilingual
Research tells us that maintaining at least 2 languages is an advantage for later academic achievement. It’s desirable for children who are potentially bilingual and multilingual, to be supported in all the languages available to them.

## The role of parents and carers
It’s better for young children to communicate with their parents in the dominant home language, especially if parents are not fluent English speakers themselves.

Children with English as an additional language may need more time settling in. This can be a cause of anxiety for the child. Sharing as much information about routines with the child’s parents is always helpful and finding an adult to interpret will deepen dialogue.

Suggest to parents to talk to the child about the setting’s routines at home. Children hearing music, songs and stories they would experience at home, in the setting contributes to settling in and values diversity. 

##Supporting children with EAL

Children with English as an additional language need to hear English spoken by the adults in the setting in as many different contexts as possible. When the context has meaning for the child they are more able to learn spoken English from the adult.

Your role is crucial in modelling the accurate use of English, noting the child’s spoken vocabulary and building on what the child already knows.

Children will start to speak English and any other languages they may be learning, in different ways. Some children will enthusiastically copy what they hear around them right from the start. Children may start by verbalising single words and 2 or 3 word phrases.

More complex spoken language in English will build up over time, with your guidance, modelling English and recasting so that the child hears their speech repeated correctly.

Some children go through a silent period. This can be for as long as 6 months. When they start to speak in English it will be more proficiently than you may expect, even in full sentences. The child will have been listening intently to adults and children in the setting and once they are confident with their initial speech, they will speak far more.
 
It is good for children with English as an additional language to be able to speak their home language in the setting and talk to providers who speak the same language if there are any. This will further aid them in learning English. Most children adapt to speaking more than one language.

The security of knowing what resources will be available in each area, each day supports children’s wellbeing and achievements in learning. Keep the provision consistent. Observing how the children respond will inform you when a change is needed. This may be to add something more, or a specific enrichment to extend the children’s learning.

Consider whether the home area, images displayed and books in the setting, reflect the child’s home environment. Include books, songs and counting in home languages.  Take sequences of photographs to show the child specific routines, such as, what happens at the snack table, how to tidy away the construction toys and a visual timetable of the session. Over time the setting becomes a secure place for the child and they gain confidence in their play and interactions.
 
Revisiting and re-proposing are beneficial for all children but especially for those acquiring English.
 
Revisiting means you draw the child’s attention to previous activities and learning where they have achieved. A prompt could be a photograph or video of them playing. It could be a sample of their mark making, a painting or a collage picture. The child can revisit by drawing over the top, and the adult sensitively describes their actions as they do this. In this way the child hears spoken language directly connected to their actions.
 
Re-proposing is when you scribe a child’s spoken dialogue and on the following day remind the child of their words. This is a launchpad for the child to either repeat what they said before or to extend what was said on the previous day.
 
When exploring rhymes and songs make comparisons between words in English and in other languages. Older children who have grasped more than one language enjoy these opportunities. They love to play with words and translate from one language to another.

##Helping children understand the setting

Consider having: 

- a visual timetable-introduced as it is happening
- feelings or emotions picture cards so children can label their own and others emotions
- photographs of areas, resources, peers and staff to support children to plan their session with an adult
- story and song props used as often as possible
- phonetically spelt key words in home languages to help you

##Using clear, concise English

When talking to children:    
	
- say less and stress, go slow and show
- be face to face
- gain their attention first
- demonstrate your meaning with actions
- give thinking time without extra language input

##Helping children to take part in activities

Consider these steps: 

- having layers of participation planned into activities, giving children time to watch what is going on.
- using ‘ladder steps’, taking the child through one step at a time.
- notice and value verbal and non-verbal communication.

##Learning opportunities that are not dependent on the child’s English language level

Consider the following: 

- experiences that are challenging and give language opportunities but not dependent on English language level
- commenting and labelling rather than questioning to support learning. Introduce vocabulary in context

##Using repeated phrases

You may want to think about familiar things to talk to the children about, such as: 

- story-telling with a clear introduction, consistent actions, props, physical acting out of stories, with or without words
- teaching call and response playground games, for example, ‘Say hello’, ‘How do you do?’ ‘Walking through the jungle’, ‘We’re going to make a circus’, ‘Put your finger on your head’

##Using information technology

You may find it helpful to use:

- video clips and photos to share learning with group at review time
- video clips and photos to share learning with parents and family
- recordings of adults telling stories in the 
 languages spoken by the children, including English

##How this links to the other areas of learning

Real life experiences support children learning English because they hear spoken English in contexts that are increasingly familiar and meaningful to them. Children benefit from hearing well-loved songs, nursery rhymes, finger rhymes and stories as often as possible and with associated props.

Exaggerate actions to give meaning to the words. Re-presenting core stories in as many ways as possible encourages children to re-enact stories in small world and drama role play. Eventually children will use the language from songs and stories in their own speech ([communication and language](/communication-and-language) and [literacy](/literacy)). Visits to places and welcoming visitors into the setting are activities that support children in learning English ([understanding the world](/understanding-the-world)). Books made using photographs of the child and their family support the child in feeling valued ([personal, social and emotional development](/personal-social-and-emotional-development)) as well encouraging the child to access books in the book area of the setting ([literacy](/literacy)).

##Online resources

BBC Resources are full of ideas for [rhymes and songs](https://www.bbc.co.uk/tiny-happy-people/nursery-rhyme-selector/zrfc3j6), materials are suitable for sharing with families.

BBC Resource explaining [the benefit of speaking your home language](https://www.bbc.co.uk/tiny-happy-people/speaking-languages/zn73f4j) with your young child.

[Article about Cultural Capital](https://www.early-education.org.uk/cultural-capital) including some practical ideas to help practitioners support and value children’s cultures.

$CTA

**Get alerts for new EYFS resources**

[Sign up to get emails when we add new early years foundation stage resources to this website](https://docs.google.com/forms/d/e/1FAIpQLSdZbPz-447CADTErT9eD1IU4yKfsEhyJy1C8U1fyFAQuEtejw/viewform?usp=sf_link)

$CTA
', '2021-06-14 09:00:39.077568', '2021-12-17 15:38:47.920583', 31, 6, 44, 37, 't', 'Helen Rapp', '', '', ''),
(41, 'Safeguarding and welfare', 'safeguarding-and-welfare', 'Access resources to help keep children safe and promote their welfare. 

[Oral health](/safeguarding-and-welfare/oral-health)

[Food safety](/safeguarding-and-welfare/food-safety)

$CTA

**Get alerts for new EYFS resources**

[Sign up to get emails when we add new early years foundation stage resources to this website](https://docs.google.com/forms/d/e/1FAIpQLSdZbPz-447CADTErT9eD1IU4yKfsEhyJy1C8U1fyFAQuEtejw/viewform?usp=sf_link)

$CTA
', '2021-08-20 14:57:55.0322', '2023-11-06 14:47:14.179858', NULL, 10, 42, 48, 't', 'Helen Rapp', '', '', ''),
(42, 'Oral health', 'oral-health', '
## Why oral health is in the EYFS framework 

The EYFS framework states that early years providers must promote good oral health of children who attend their setting.  
 
Oral health is important, even with baby teeth. This is because children''s baby teeth:  
 
- help them to bite and chew 
- support speech and language development  
- help them feel confident when they smile  
- make space for and help to guide adult teeth  

Good oral health also keeps children free from toothache, infection and swollen gums.  

## Tooth decay

Children need to form good oral health habits from an early age to help avoid tooth decay. Tooth decay happens when sugars from food and drinks interact with bacteria in tooth plaque. This results in acid production, causing holes in teeth known as cavities.  

If children have tooth decay, they may have yellow, brown or black marks on their teeth. They may also complain about their teeth hurting, particularly when eating or drinking.  

![An image of a child''s decayed teeth. The teeth have visible black, yellow and brown patches.](https://help-for-early-years-providers.education.gov.uk/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBZ2dDIiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--319e62d541058ffdd346a67a00df4c83f031aff6/iStock-889380722.jpg "Child with tooth decay")

Tooth decay is largely preventable, but it’s still a serious problem among young children. The Office for Health Improvement and Disparities oral health survey of 5 year old children 2022 and Public Health England oral health survey of 3 year old children 2020 found that:  
 
- nearly a quarter of 5 year olds in England have tooth decay, affecting 3 to 4 teeth on average  

- children from more deprived backgrounds are more likely to have tooth decay  

- 11% of 3 year olds in England have visible tooth decay, affecting 3 teeth on average  

You can find links to the surveys in the useful resources section at the end of this article.  
 
Having decayed teeth removed is also the most common reason for surgery under a general anaesthetic for children aged 6 to 10.   

## Looking after children’s oral health

There are several key steps practitioners, parents and carers can take to promote good oral health in children.

### Cutting down on free sugars 

You should limit the amount of free sugars children eat or drink in your setting, as well as how often they consume them. This can help to avoid tooth decay.  
 
Free sugars include all sugar added to food and drinks by the manufacturer, cook or consumer. They are found in foods like:

- cakes, biscuits and chocolates 
- processed foods - like some jarred sauces, jams and breakfast cereals 
- some flavoured yoghurts 

They are also found in natural products like: 

- honey and syrups
- fruit juices and purees 
- smoothies 

Free sugars are not found in: 

- whole fruit and vegetables 
- plain, unflavoured milk and yoghurt 
- water 

Water and milk are the only safe drinks to give children in regard to their oral health. Fruit juices and smoothies should not form part of a young child’s daily diet. 

As well as limiting the amount of free sugars children eat or drink, you should also make sure that they only have food or drinks that contain sugar at mealtimes. This is because, the more often their teeth come into contact with sugar, the more likely they will be to get tooth decay. Children should avoid food and drinks containing free sugars before bedtime and overnight.

### Drinking bottles and cups  

What children drink from can impact their oral health.  

You should only give babies bottles of breast milk, formula milk, or boiled water that has cooled down.  

From 6 months old, you can offer babies drinks in open-top cups. These are cups with no lids, which spill if knocked over. These cups can help children develop their sipping skills. This strengthens their face muscles, which helps them to bite, chew and talk. 

When introducing open-top cups, start with smaller cups or those with handles. These are easier for babies to grip. Offer a small amount of water at first, and gradually increase this over time.  

You may need to show babies how to use the cup and help them to hold it at first. Some babies may need to use a sipping cup or beaker with a spout before they can use an open-top cup. If this is the case, you should make sure that the spout does not have a valve, that drinks can freely flow through it, and that babies do not need to suck.  

From 12 months old onwards, you should encourage children to have all drinks in open-top cups. From this point, avoid using any bottles or cups that need children to suck, like those with soft teats or valves.  

You can find an NHS video about how and when to move babies from bottles to cups in the useful resources section at the end of this article.   

### Brushing teeth 

As soon as a child’s teeth start to come through, they are ready for tooth brushing to start. 

For effective tooth brushing: 

- use a fluoride toothpaste that contains at least 1000 parts per million (ppm) of fluoride - you can find this information  on the packaging
- use a smear of toothpaste for children under 3, and a pea sized amount for those aged 3 to 6 
- brush in circles for around 2 minutes, making sure to cover the whole of each tooth
- brush twice a day, including once just before bed - this allows the fluoride to keep working while children sleep
- children should spit, not rinse, after brushing - this avoids washing away the fluoride 
- adults should help children to brush their teeth until they are 7 years old to make sure they are brushing properly

The images below show what a smear and a pea sized amount of toothpaste look like on a typical child''s toothbrush.

![A child''s toothbrush with a 2cm brush head. There is a thin smear of toothpaste extending about half the length of the brush head.](https://help-for-early-years-providers.education.gov.uk/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBZ2tDIiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--f5ff72ad6448a2d43c94c9b3e405ff958a951231/smear-toothpaste-v2.jpg "Child''s toothbrush with smear of toothpaste")

Use a smear of toothpaste for children under 3.

![A graphic of a child''s toothbrush with a 2cm brush head. There is a pea-sized blob of toothpaste extending about half the length of the brush head.](https://help-for-early-years-providers.education.gov.uk/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBZ29DIiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--98dcd86553e6ad53ae12a3e785c26e3dec917744/blob-toothpaste-v2.jpg "Child''s toothbrush with blob of toothpaste")

Use a pea sized blob of toothpaste for children aged 3 to 6.

## How to promote good oral health in your setting    

You can decide how you promote oral health based on what works best in your setting. Ideally, you should link oral health to other key topics, like self-care, healthy eating, and physical development. 

Being playful with children can help to promote good oral health. There are a number of activities you can use to teach them about tooth brushing and care. 

#### Dentist role play

Try setting up a dentist role play in your setting. This familiarises children with the dentist’s environment, equipment and processes. 

#### Practise tooth brushing on dolls and toys 

You can show children how to do this yourself first to model effective tooth brushing. 

#### Brush model teeth 

Use a set of model teeth or a laminated picture, and add playdough, marker pen or tissue paper to represent tooth plaque. Encourage the children to use a toothbrush to remove the ‘plaque’. 

### Stories and discussion  
 
You can read stories with children about teeth and smiles. These can cover important topics like visiting the dentist and brushing teeth. You should also discuss the foods and drinks that do and do not help to grow healthy, strong teeth with children. 

Talking tubs are a good way to promote conversations with children. Place items related to oral health in a tub, then get children to explore and talk about them with you. 

You can add things like: 

- toothbrushes
- pictures of dentists
- false or model teeth
- a selection of foods and drinks
 
### Visits with dentists 

You could contact your local dental surgery and ask them if it is possible to show the children around. This will help familiarise the children with the environment and equipment dentists use. You could also invite a member of the dental team to your setting to talk about their job and the importance of good oral health. 
  
### Supervised tooth brushing programmes 

Supervised tooth brushing may be suitable in your setting. These programmes have been found to prevent tooth decay by teaching children how to brush their teeth and encourage tooth brushing routines at home. Children also benefit from brushing their teeth with fluoride toothpaste once a day while at their early years setting. This is especially important for those children who may not regularly brush their teeth at home.   

There are different schemes that support supervised tooth brushing. Speak to your local authority  to see what may be on offer in your local area. 

You can find useful resources to help you with supervised tooth brushing at the end of this article. 

## Case study - Tinsley Meadows Primary Academy 

David Yates, a teacher at Tinsley Meadows Primary Academy in Sheffield, set up a supervised tooth brushing club for his 3 to 4 year olds.   

David had noticed how tooth decay and toothache were impacting on his Foundation Stage 1 class. They were affecting both the children''s speech development and their wider learning.  

He wanted to find a way to prevent tooth decay that was:  

- easy to build in to the daily class routine  
- in line with EYFS requirements 
- fun for the children  

As a first step, David contacted the school''s local authority. They then put him in touch with their oral health promotion team, who advised him on different options he could try. After this meeting, David decided to get permission from the school’s senior leadership team to set up a supervised tooth brushing club.  

A member of the oral health promotion team helped David set up the club and provided:  

- training and a protocol for practitioners to follow 
- toothbrushes, toothpaste and toothbrush racks  
- a workshop for parents and carers to explain what the club involved and answer their questions about oral health  
- a follow up visit one month later to review how the club was going  
- ongoing support and supplies to keep the club running  

The club has been running for over 5 years, although it had to be paused during the Covid-19 pandemic. More than 60 children now attend. The school use the club to support other topics about healthy diet, as well as role play activities and stories about visiting the dentist.  

David has seen lots of benefits for children who attend the club, including:  

- enjoying brushing their teeth more  
- learning from watching each other  
- positive feedback from parents, who say the children are more co-operative with tooth brushing at home  

^“At first I did think... we are going to do tooth brushing now and we have 60 children. What if it is chaos and they all brush each other’s hair, or they all share? But they are really good at it. I am proud of them. The children seem to enjoy and engage with it. It’s a whole group experience so it’s something that we do as a shared thing. For other practitioners thinking about trying supervised tooth brushing, I would say do it! Find a local expert, get some initial training, and then give it a go." <br> <br> - David Yates, teacher at Tinsley Meadows Primary Academy

## Promoting good oral health at home   

There are a number of ways you can help parents and carers promote good oral health at home. However, you should not offer individual or specific advice. Parents and carers must speak to healthcare professionals, like a dentist or member of the dental team, for medical advice. 


### Speaking to parents and carers 

Children should go to the dentist when they get their first tooth or from 1 year old, whichever comes first. 

NHS dental services are free for all children under 18. 

In introductory meetings with parents and carers, you can: 

- share this information with them
- ask if they have taken their child to the dentist
- encourage them to do so if their child has their first tooth or is over 1 year old 

### Sharing oral health resources 

Oral health posters and leaflets can build other practitioners’, parents’ and carers’ knowledge on oral health. 

You can share these by: 

- displaying them in the entryways to your setting
- handing them out at the beginning or end of a session
- placing them in staff rooms and communal areas

See the useful resources at the end of this article for a range of online resources that you can share. 

### Helping families get support for children’s oral health 

If a family has concerns about their child’s oral health, signpost them to their dentist for further assessment and support. Local  NHS dentists can be found on the  [NHS  website](https://www.nhs.uk/service-search/find-a-dentist).  

If the child needs urgent dental care, and their dentist does not offer emergency appointments, parents and carers can contact [NHS 111](https://www.nhs.uk/nhs-services/urgent-and-emergency-care-services/when-to-use-111/). 

## Useful resources 

This [toolkit by Public Health England](https://www.gov.uk/government/publications/improving-oral-health-supervised-tooth-brushing-programme-toolkit) gives more information on how to set up supervised tooth brushing programmes. 

This [Children’s Oral Health healthcare e-learning](https://www.e-lfh.org.uk/programmes/childrens-oral-health/) is aimed at parents, early years healthcare workers, teachers, nurses, GPs and the public.  

The British Society of Paediatric Dentistry have created a series of [oral health videos for children](https://www.bspd.co.uk/Kidsvids), in partnership with Dr Ranj, Hey Duggee and CBeebies.  

This [NHS video on baby bottles and cups](https://www.youtube.com/watch?v=TxFhhP53r1U) explains when to move babies from bottles to cups and why.  

This [supervised tooth brushing video](https://www.youtube.com/watch?v=QwcYgTQMPjY) from Early Start Nutrition shows a session in action.  
 
Use this tool to [find your local authority](https://www.gov.uk/find-local-council). Your local authority may be able to offer support to introduce supervised tooth brushing in your setting.  

The [looking after your baby''s teeth NHS page](https://www.nhs.uk/conditions/baby/babys-development/teething/looking-after-your-babys-teeth/) explains how to brush and care for babies’ and young children’s teeth.  

This BBC article explains key strategies for [showing a toddler how to brush their teeth](https://www.bbc.co.uk/tiny-happy-people/teddy-teeth-cleaning/zksybqt).  

This [healthy teeth video from HENRY](https://www.henry.org.uk/videos/healthyteeth) looks at what we can do to help children grow up with healthy teeth. 
 
Dr Milad Shadrooh, known as The Singing Dentist, shares [advice and answers to common questions about taking care of children’s teeth](https://www.bbc.co.uk/tiny-happy-people/dentist-q-a/z6jbydm).  

PACEY’s [oral health advice](https://www.pacey.org.uk/working-in-childcare/spotlight-on/oral-health/) includes fact sheets for parents, and their  [nutrition spotlight](https://www.pacey.org.uk/working-in-childcare/spotlight-on/nutrition/) encourages healthy eating habits. 

The Office for Health Improvement and Disparities [oral health survey of 5 year old children 2022](https://www.gov.uk/government/statistics/oral-health-survey-of-5-year-old-children-2022) and Public Health England’s [oral health survey of 3 year old children 2020](https://www.gov.uk/government/statistics/oral-health-survey-of-3-year-old-children-2020) include statistics about oral health in the early years. ', '2021-08-20 14:57:55.383155', '2023-06-07 14:27:17.17009', 41, 1, 43, 41, 't', 'Claire Jones', '', '{:.contents-list__list}
* {:.contents-list__list-item .contents-list__list-item--dashed} [Why oral health is in the EYFS framework](#why-oral-health-is-in-the-EYFS-framework)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Tooth decay](#tooth-decay)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Looking after children''s oral health](#looking-after-childrens-oral-health)
* {:.contents-list__list-item .contents-list__list-item--dashed} [How to promote good oral health in your setting](#how-to-promote-good-oral-health-in-your-setting)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Case study - Tinsley Meadows Primary Academy](#case-study---tinsley-meadows-primary-academy)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Promoting good oral health at home](#promoting-good-oral-health-at-home)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Useful resources](#useful-resources)', 'Find out about promoting oral health as part of the early years foundation stage (EYFS).'),
(43, 'Food safety', 'food-safety', '##Why is food safety so important for young children?

The [EYFS framework](https://www.gov.uk/government/publications/early-years-foundation-stage-framework--2) requires providers to take all necessary steps to keep children safe and well – and you must be confident that those responsible for preparing and handling food in your setting are competent to do so.

Tragically, a child dies in the UK every month from choking and hundreds more require hospital treatment.  It can happen quickly and it can happen to anyone.

Babies and young children’s immune systems are not as strong and developed as adults'' which means they are more vulnerable to infections which can lead to food poisoning.  It is important to take extra care with hygiene and preparing food safely.

##What it says in the EYFS framework

Staffing arrangements must meet the needs of all children and ensure their safety. You must ensure that children are adequately supervised, including whilst eating.

Before a child is admitted to the setting, you must obtain information about any special dietary requirements, preferences and food allergies that the child has, and any special health requirements.

There must be an area which is adequately equipped to provide healthy meals, snacks and drinks for children as necessary. There must be suitable facilities for the hygienic preparation of food for children, if necessary including suitable sterilisation equipment for babies’ food. You must be confident that those responsible for preparing and handling food are competent to do so. In group provision, all staff involved in preparing and handling food must receive training in food hygiene.

[Statutory framework for the early years foundation stage](https://www.gov.uk/government/publications/early-years-foundation-stage-framework--2), pages 28 and 33.

##Food safety advice for children age 5 and under

###How to reduce the risk of choking

Food preparation:

- remove any stones and pips from fruit before serving
- cut small round foods, like grapes, strawberries and cherry tomatoes, lengthways and into quarters
- cut large fruits like melon, and hard fruit or vegetables like raw apple and carrot into slices instead of small chunks
- do not offer raisins as a snack to children under 12 months – although these can be chopped up as part of a meal
- soften hard fruit and vegetables (such as carrot and apple) and remove the skins when first given to babies from around 6 months
- sausages should be avoided due to their high salt content, but if offered to children these should be cut into thin strips rather than chunks and remove the skins
- remove bones from meat or fish
- do not give whole nuts to children under five years old
- do not give whole seeds to children under five years old
- cut cheese into strips rather than chunks
- do not give popcorn as a snack
- do not give children marshmallows or jelly cubes from a packet either to eat or as part of messy play activities as they can get stuck in the throat
- do not give children hard sweets

###Supervision

Infants and young children should be seated safely in a highchair or appropriately sized low chair while eating.  Infants and young children should never be left alone while they are eating, and staff should be familiar with paediatric first aid advice for children who are choking.

The criteria for effective Paediatric First Aid (PFA) training can be found in the [Statutory framework for the early years foundation stage](https://www.gov.uk/government/publications/early-years-foundation-stage-framework--2), Annex A.

###Useful resources

- [Early years choking hazards poster and table (foundationyears.org.uk)](https://foundationyears.org.uk/2021/09/food-safety-advice-on-choking-hazards-in-settings/)
- [Early Start Nutrition - Preparing food safely for young children (video)](https://www.youtube.com/watch?v=wCjZLbejZm8)
- [Choking hazards in the home and how to avoid them (rospa.com)](https://www.rospa.com/rospaweb/docs/advice-services/home-safety/choking-hazards.pdf)

##Food and drinks to avoid

###Drinks

Provide only fresh tap water and plain milk for children to drink.  Fruit juice, smoothies, squash, fizzy drinks and flavoured milk, even when diluted, contain lots of sugar and can cause tooth decay. Diet or reduced-sugar drinks are not recommended for babies and toddlers either. For older children, these drinks can fill children up so they’re not hungry for healthier food.

When offering dairy alternatives to cow’s milk:

- Unsweetened calcium-fortified, plant-based drinks (such as soya, oat and almond drinks) should be avoided before 12 months, however small amounts can be used in cooking. These drinks can be given from 12 months as part of a healthy balanced diet.
- Do not give children under 5 rice drinks, because of the level of arsenic they contain.

###Foods to avoid before around 6 months of age

Ideally, babies should be introduced to solid foods from around 6 months of age.  If parents or carers have decided to introduce solid foods to their child before 6 months of age, you will need to work closely with them to ensure a consistent and safe approach.

It is important to remember that there are some foods which should not be given before 6 months of age:

- cow’s milk
- eggs
- foods containing wheat or gluten, including wheat, barley and rye (for example bread, pasta)
- nuts, peanuts and peanut products
- seeds
- fish and shellfish
- honey – avoid honey until 12 months old
- if a baby is less than 6 months old, sterilise water by boiling it first and then letting it cool right down - once a baby is 6 months old, this is no longer necessary

###Foods to avoid up to 12 months

- honey for infants under 1 year, as it occasionally contains bacteria which can make them ill

###Foods to avoid up to 5 years

- **Nuts**, especially peanuts, can cause severe allergic reactions in some children and all settings should have an allergy plan in place. Whole nuts, peanuts and seeds should not be given to children under 5 years old as they pose a choking risk.
- **Raw eggs**, or food containing partially cooked eggs, for example uncooked cake mixture and runny boiled eggs (unless they have the red lion stamp or you see the words “British Lion quality”).
- **Foods high in salt** such as: sausages, bacon, crackers, crisps, ready meals and takeaways.
- **Sugar** – both in sugary snacks and by not adding sugar to food.
- **Foods high in saturated fat** such as biscuits, crisps and cakes.
- **Fresh pate** (meat, fish or vegetable-based) to reduce the risk of food poisoning.
- **Unpasteurised milk, milk drinks and cheese**, mould-ripened cheeses and soft blue-veined cheese, to reduce the risk of food poisoning.  However, these cheeses can be used as part of a cooked recipe as listeria is killed by cooking.
- **Shark, swordfish and marlin** as the levels of mercury in these fish can affect a child’s developing nervous system.
- **Raw shellfish** to reduce the risk of food poisoning, and make sure any shellfish you use is thoroughly cooked.
- **Raw jelly cubes** – these are a choking hazard.

###Foods to serve occasionally from 6 months to 4 years

- Although it is recommended to provide oily fish in early years settings at least once every 3 weeks, do not provide it more than twice a week, as it can contain low levels of pollutants.

##Useful resources

- [Foods to avoid giving babies and young children - NHS (www.nhs.uk)](https://www.nhs.uk/conditions/baby/weaning-and-feeding/foods-to-avoid-giving-babies-and-young-children/)
- [What to feed young children - NHS (www.nhs.uk)](https://www.nhs.uk/conditions/baby/weaning-and-feeding/what-to-feed-young-children/)
- [Baby and toddler meal ideas - NHS (www.nhs.uk)](https://www.nhs.uk/conditions/baby/weaning-and-feeding/baby-and-toddler-meal-ideas/)
- [Example menus for early years settings in England - Part 1: Guidance](https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/658870/Early_years_menus_part_1_guidance.pdf)
- [Example menus for early years settings in England - Part 2: Recipes](https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/658872/Early_years_menus_part_2_recipes.pdf)

##Safe weaning

Progression from the introduction of first foods (at about 6 months), to a range of blended or mashed foods, and then to a wider range of chopped or minced foods should be a gradual process, based on each infants’ developmental readiness, rather than a staged process based on age alone.

[Start4Life](https://www.nhs.uk/start4life/weaning/) have lots of helpful information for parents regarding safe weaning, which you will also find it helpful to refer to.

##How to prepare infant formula bottles

Good hygiene is very important when making up a formula feed.  Babies’ immune systems are not as strong as adults’ therefore all bottles, teats and feeding equipment need to be washed and sterilised before each feed.  The NHS has a helpful step by step guide on how to prepare infant formula.

##Useful resources

- [Your baby''s first solid foods - NHS (www.nhs.uk)](https://www.nhs.uk/conditions/baby/weaning-and-feeding/babys-first-solid-foods/)
- [Help your baby enjoy new foods - NHS (www.nhs.uk)](https://www.nhs.uk/conditions/baby/weaning-and-feeding/help-your-baby-enjoy-new-foods/)
- [Drinks and cups for babies and young children - NHS (www.nhs.uk)](https://www.nhs.uk/conditions/baby/weaning-and-feeding/drinks-and-cups-for-babies-and-young-children/)
- [How to make up baby formula - NHS (www.nhs.uk)](https://www.nhs.uk/conditions/baby/breastfeeding-and-bottle-feeding/bottle-feeding/making-up-baby-formula/)

##Allergies

Early years settings and your food provider should work closely with families to support children with allergies or intolerances. As part of the [EYFS framework](https://www.gov.uk/government/publications/early-years-foundation-stage-framework--2), you are required to obtain information about children’s special dietary requirements – including food allergies and intolerances – before they attend, and record and act on the information provided about children’s dietary needs.

There should be a protocol in place which is accessible to all staff, to ensure everyone is aware of individual children’s allergies and symptoms.

Understanding which allergens are present in every meal and snack you provide is an important step in providing food which is safe for children with food allergies and intolerances. Since 2014, all food businesses, including early years settings, have been required by law to give details about the allergens in the food they provide.

##Useful resources

- [Food allergies in babies and young children - NHS (www.nhs.uk)](https://www.nhs.uk/conditions/baby/weaning-and-feeding/food-allergies-in-babies-and-young-children/)

- [Food allergy - NHS](https://www.nhs.uk/conditions/food-allergy/)

- [Allergy UK National Charity Free Allergy Support & Resources](https://www.allergyuk.org/)

- [Allergen guidance for food businesses - Food Standards Agency](https://www.food.gov.uk/business-guidance/allergen-guidance-for-food-businesses)

##Hygiene

Food should be stored, prepared and presented in a safe and hygienic environment. This is especially important when providing food for young children, as they may have a low resistance to food poisoning. It is also important that children are taught basic hygiene themselves, such as not eating food that has fallen on the floor, and washing their hands with soap and warm water before eating meals or snacks and after going to the toilet or handling animals.

Ensure food is cooked until steaming hot to kill harmful bacteria, and is then cooled sufficiently before giving it to infants and young children.

Wash all surfaces for preparing or eating food, especially chopping boards, with hot soapy water (and keep pets away from them). Make sure all bowls and spoons are washed with hot soapy water. Tea towels, kitchen cloths or sponges can harbour lots of germs, so wash them regularly.

Further information on food hygiene:

- [Children''s food: safety and hygiene - NHS (www.nhs.uk)](https://www.nhs.uk/conditions/baby/weaning-and-feeding/childrens-food-safety-and-hygiene/)
- [Safer food, better business (SFBB) Food Standards Agency](https://www.food.gov.uk/business-guidance/safer-food-better-business-sfbb)
- [Safer food, better business for childminders Food Standards Agency](https://www.food.gov.uk/business-guidance/safer-food-better-business-for-childminders)

$CTA

**Get alerts for new EYFS resources**

[Sign up to get emails when we add new early years foundation stage resources to this website](https://docs.google.com/forms/d/e/1FAIpQLSdZbPz-447CADTErT9eD1IU4yKfsEhyJy1C8U1fyFAQuEtejw/viewform?usp=sf_link)

$CTA', '2021-08-20 14:57:55.678502', '2023-01-18 16:06:01.653912', 41, 2, 45, 42, 't', 'Jenny Pendriss', '', '{:.contents-list__list}
* {:.contents-list__list-item .contents-list__list-item--dashed} [Why is food safety so important for young children?](#why-is-food-safety-so-important-for-young-children)
* {:.contents-list__list-item .contents-list__list-item--dashed} [What it says in the EYFS framework](#what-it-says-in-the-eyfs-framework)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Food safety advice for children age 5 and under](#food-safety-advice-for-children-age-5-and-under)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Food and drinks to avoid](#food-and-drinks-to-avoid)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Safe weaning](#safe-weaning)
* {:.contents-list__list-item .contents-list__list-item--dashed} [How to prepare infant formula bottles](#how-to-prepare-infant-formula-bottles)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Allergies](#allergies)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Hygiene](#hygiene)', ''),
(44, 'Meeting the needs of all children', 'meeting-the-needs-of-all-children', 'Find out more about the importance of supporting every child to achieve their best outcomes including children with special educational needs and disabilities (SEND).

As stated in the [Early Years Foundation Stage (EYFS) framework](https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/974907/EYFS_framework_-_March_2021.pdf), "providers must have arrangements in place to support children with SEN or disabilities". 

Your role in supporting children is especially important as this will likely be the child’s first experience of education outside of the home. You should make this a positive, safe and inclusive experience for every child.

##Supporting children to build strong foundations

All children are entitled to a high-quality education that promotes high standards, is appropriate to their needs, and helps them to achieve their best possible outcomes and fulfil their potential. 

By getting to know your children well, you will notice that children learn at different rates, some may struggle to do some of the things that other children may already be capable of. This is part of normal childhood development and may just indicate that, with minor adjustments to the teaching methods, or the provision of small amounts of support, encouragement and additional help, good progress can be made. It is therefore important that early delays or difficulties lead to the right sort of help and are not necessarily regarded as an indication of a long-term special educational need or disability. 

Not all needs will be long term, but it is important that where you might have some concerns, you plan their activities and curriculum in a way that supports those children early on. One example would be a child who has grown up in a home where the adults are not in the habit of engaging their child in conversation regularly.  This could mean the child has not learnt turn-taking or eye contact and so on for conversations. The child may also not know as many words as other children of the same age. This does not necessarily mean they have SEND but they will need help, support and encouragement to develop their early language skills and vocabulary. You can support them to improve their communication and language by modelling turn taking in conversation with other children or adults and by reading to them frequently, so that they experience new words daily. [Development Matters](https://www.gov.uk/government/publications/development-matters--2) provides many examples of how to support babies’ and children’s communication and language development. They will quite quickly return to making good progress again with sensitive support and close working partnerships with parents and carers.

This early support can make all the difference to a child’s learning and development and can help a child overcome an additional need altogether. It is crucial that settings spend time with their children to really get to know them – how they learn, what they enjoy, what they might struggle with, where they may need more support in to secure their learning. This all helps to build strong and solid foundations for their future growth development.

Some needs may be greater and there may be concerns that further support or interventions are needed to help meet that child’s needs. As set out in the EYFS, all early years providers are required to have arrangements in place to identify and support children with SEND and to promote equality of opportunity for children in their care. It is equally important that children who do not have SEND or require additional support understand that some children may have different needs to them and how to respond appropriately to them

Teaching, curriculums and care should be adaptive, responding to the needs of children which may include providing targeted support to children who are at risk of falling behind. Providers should ensure environments are inclusive, by aiming high, being ambitious and be willing to find different ways to engage with children, changing approaches or removing barriers to enable them to reach their potential. Some things may be differentiated to help facilitate learning in a way that supports a child that might have difficulties communicating through speech or understanding written words. For example, using a visual timetable to help some children to understand a routine or incorporating Makaton into songs and stories. 

##Working together

To build a whole picture of the child, it is important that you work in partnership with other adults in the setting such as the SENCO (if relevant to your setting), teaching and nursery assistants and any relevant local agencies to gather their views and observations. These views and observations should feed into your assessments of a child and help you to make your own strong and informed professional judgments about that child. You can make all the difference to a child’s experience and development.

You need to build strong relationships with children’s parents or carers and involve them in supporting their children and meeting their needs throughout their time in your care. Parents or carers know their children best and may have important insights into their development that could help identify needs early and help build the right support package for their child. You are also required to review children’s progress at age 2 and share a summary with parents, more information can be found in the [EYFS framework, page 18-19, paragraphs 2.4 – 2.6](https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/974907/EYFS_framework_-_March_2021.pdf). Health care officials such as health visitors are also important in helping to build a full picture of a child and any potential concerns about their development. Parents should be involved in the planning support and, where appropriate, there may be things you can do to support the child’s learning at home.

Where a child is subject to a referral or requires the use of a specific service, there are often opportunities to seek advice from professionals in order to provide a joined-up approach for the child and to inform how you can best support the child. For example, services such as Occupational Health can provide specialised equipment to support children to access your setting and take part in activities.

##Supporting and identifying SEND

Needs should be identified accurately and support put in place quickly in order to give all children the best opportunities to achieve their potential. Identifying a need but not acting on it can be detrimental in the long term. 

Children with complex developmental and sensory needs are likely to be identified at birth through health assessments whilst other children may have needs identified following the 2-year progress check.  In addition to the formal checks, early years practitioners play a crucial role in monitoring and reviewing the progress and development of all children. Observations and professional judgements may identify that a child has special educational needs.

Identifying children who are presenting with less complex or hidden needs can sometimes be more challenging than identifying more apparent special educational needs and disabilities. As outlined above, there are many reasons why children might not make the progress expected over a period of time. It is important that you identify any gaps in a timely way and work with the child to help them overcome and bridge those gaps.  

As a starting point, [Development Matters](https://www.gov.uk/government/publications/development-matters--2) provides some observational checkpoints to help you to consider potential areas of need, but this guidance is not designed to be used as a tracker or tick list that generates lots of paperwork. Some examples of the checkpoints to consider include: 

 - **Communication and Language** For children age birth to 3, “watch out for children whose speech is not easily understood by unfamiliar adults. Monitor their progress and consider whether a hearing test might be needed.”
- **Person, Social and Emotional Development**
For children age 3-4, “watch out for children who seem worried, sad or angry for much of the time, children who seem to flit from one thing to the next or children who seem to stay for over-long periods doing the same thing, and become distressed if they are encouraged to do something different. You will need to work closely with parents and other agencies to find out more about these developmental difficulties.

Whilst one of the aims of the EYFS reforms (2021) are to reduce unnecessary paperwork and tracking, appropriate records should be kept if it benefits the child to do so, this can be particularly helpful information for the receiving school when a child transitions to reception or Year 1.  Where routine observation raises a potential concern for a child''s development, you should liaise with your SENCO (if relevant to your setting) and the child’s parents or carers early on.

##Resources to help support your children and identify their needs

Providers should develop a curriculum that aims to meet the needs of all children, including those with SEND. Guidance is available to support curriculum planning and help providers to keep in mind those children who may need additional support. 

Where a practitioner assessment suggests more formal support is required practitioners should work closely with parents and other practitioners and follow the ‘graduated approach’ in the [special educational needs and disability (SEND) code of practice](https://www.gov.uk/government/publications/send-code-of-practice-0-to-25). This covers the support process for children with identified SEND, covering 4 areas of need: cognition, learning, communication and interaction. Practitioner and parent observations are key in informing decisions to instate more formal support requirements such as the Education, Health and Care Plan (EHCP). 

Practitioners can use toolkits to help them assess children’s ongoing needs and ensure that the right support is in place from as early as possible. Various toolkits are available and you can work together with your local authority to help develop a pathway for getting further support, we’ve included some examples below:

 - NASEN provides a SEND Gateway that enables access to a broad range of materials and support services across the range of SEN ([www.sendgateway.org.uk](https://www.sendgateway.org.uk/)).
 - Early Support provides a range of information materials to families and professionals [www.ncb.org.uk/earlysupport](https://www.ncb.org.uk/earlysupport).
 - [Early Years Measures database](https://educationendowmentfoundation.org.uk/projects-and-evaluation/evaluating-projects/early-years-measure-database/early-years-measures-database/) discusses a range of diagnostic assessment tools to use in the early years.
 - Pen Green Centre for Children and their Families have created another useful guidance document on taking [a celebratory approach to working with children with SEND](https://www.pengreen.org/a-celebratory-approach-to-working-with-children-with-send/). It offers a practical toolkit with examples of how to support them and potential frameworks you could use to identify, support and assess children with SEND. 

$CTA

**Get alerts for new EYFS resources**

[Sign up to get emails when we add new early years foundation stage resources to this website](https://docs.google.com/forms/d/e/1FAIpQLSdZbPz-447CADTErT9eD1IU4yKfsEhyJy1C8U1fyFAQuEtejw/viewform?usp=sf_link)

$CTA
', '2021-09-24 10:04:44.649652', '2023-01-18 16:32:07.48909', 31, 11, 46, 38, 't', 'Jenny Pendriss', '', '', ''),
(45, 'Internet safety', 'internet-safety', 'Get insights on how screen use impacts young children and how it can benefit them in early years settings.

By Ghislaine Bombusa, Head of Digital, [Internet Matters](http://internetmatters.org/)

Ghislaine works closely with online safety experts to develop advice and guidance that helps to educate and inform parents about online safety issues.

##What children in the early years are doing online 

Children in the early years are now more digitally savvy than ever before. Their use of digital devices is commonplace with apps like YouTube Kids becoming a destination of choice for 72% of children aged 3 to 4 according to a recent [Ofcom report](https://www.ofcom.org.uk/research-and-data/media-literacy-research/childrens/children-and-parents-media-use-and-attitudes-report-2021). 

Research also shows that children are moving away from watching TV, opting for video-on-demand content on video-sharing platforms to watch cartoons, mini movies and songs. However, unlike older children, only a small number of children aged 3 to 4 (23%) play games online.

![Two children, one using a tablet, the other using a laptop
](https://help-for-early-years-providers.education.gov.uk/rails/active_storage/blobs/proxy/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBZ1FDIiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--783c5e4b6674739e210b54b864dd3ad1bad49736/internet-safety-960x640.jpg "Two children, one using a tablet, the other using a laptop")

##The impact of device use on children''s development in the early years 

Screen use can have a number of benefits for children in the early years but also comes with some challenges that staff should be aware of. Ongoing research suggests there are both positive and negative developmental outcomes.

Benefits of screen use include:

- opportunities to promote creativity and learning
- language development
- improvement of numeracy and literacy skills
- greater understanding of their world
- development of digital skills

Challenges of screen use include:

- impact on children’s ability to control their emotions
- displacement of activities that promote social interactions vital for development
- risk of exposure to inappropriate content

##Screen time for children in the early years

In the UK, the Royal College of Paediatrics and Child Health published [guidance for parents and clinicians](https://www.rcpch.ac.uk/resources/health-impacts-screen-time-guide-clinicians-parents), suggesting that ''there are no ‘safe’ amounts of screen time.’ The right amount of screen use will vary between families.

This approach emphasises the need to assess screen time limits based on the needs of the child while ensuring sleep and social activities are not negatively impacted.

Most recognise that the quality of what children consume will have the most impact. 

For example, encouraging children to watch or engage with content that helps them learn about the world around them or using apps designed for kids to stay active, are just some of the ways that screen time can help children thrive on and offline.

Therefore, the content and context of screen time becomes central to children getting the most out of their online use.

##Advice for early years practitioners

As devices become more commonplace in early years settings, here are some tips on how practitioners can help children use screens safely.

Things you can do to support children’s use of technology in your setting include:

- outlining how you support children''s use of technology in your setting - it can be helpful to combine this with safeguarding policies
- using [device safety settings](https://www.internetmatters.org/parental-controls/) to ensure apps and content are age-appropriate
- monitoring and supporting children while they use devices
- thinking about what you post online and how this may impact your role - this could be ensuring you do not share details about children, parents or other practitioners and adhering to any social media policies which cover staff personal use of social media platforms
- getting parental consent before creating or sharing images of children and store them safely

You should teach children about internet safety by:

- making them aware of what safe use of technology looks like
- choosing [educational apps and platforms](https://www.gov.uk/government/news/early-years-apps-approved-to-help-families-kick-start-learning-at-home) that help them to develop their skills
- having conversations and sharing advice with parents to encourage safe online use in the home

Stay informed about issues that young children face online through [online safety training](https://www.internetmatters.org/schools-esafety/pre-school/training/) and by keeping up to date with [news and research on internet safety](https://www.internetmatters.org/hub/?tab=research).

##Further reading 

[Safeguarding children and protecting professionals in early years settings: online safety guidance for practitioners](https://www.gov.uk/government/publications/safeguarding-children-and-protecting-professionals-in-early-years-settings-online-safety-considerations/safeguarding-children-and-protecting-professionals-in-early-years-settings-online-safety-guidance-for-practitioners) - UK Council for Internet Safety

[Internet safety checklist for pre-school children](https://www.internetmatters.org/advice/0-5/) - Internet Matters', '2022-02-07 10:04:24.557649', '2022-02-07 14:20:39.50045', 41, 12, 1, 43, 't', 'Helen Rapp', 'Get insights on how screen use impacts young children and how it can benefit them in early years settings.', '', ''),
(46, 'Sensory food education', 'sensory-food-education', 'Get insights on how sensory food education can help young children engage with food, and benefit them in early years (EY) settings. 

![Children trying carrot sticks](https://help-for-early-years-providers.education.gov.uk/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBZ1lDIiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--0e604a0b4ab51469b378c5370b3b4209669e7d16/sensory_food_education.jpg "Children trying carrot sticks")  

By [TastEd](https://www.tasteeducation.com/) 

TastEd works with EY settings and primary schools, training practitioners in delivering sensory food education. TastEd - based on the Sapere method used in Finland and Sweden - gives children opportunities to explore food, using their senses, to help them learn to love eating vegetables and fruit, for life. 

TastEd’s sensory food education activities support the Early Years Foundation Stage Statutory Framework and Development Matters guidance and can be used in any EY setting.

## What is sensory food education?

This hands-on approach teaches children how to use all 5 senses (sight, smell, touch, hear, taste) to explore food and their own personal food preferences. It captures children’s curiosity and gives them the opportunity to discover new foods which they may not have tried at home. Learning through play helps build familiarity and can lead to an increased acceptance of new foods. Sometimes a child may have tried a food at home and disliked it, but can find that the food becomes more appealing in a new setting, surrounded by friends and trusted adults.

## Why do we need sensory food education?

According to the [Food Foundation](https://foodfoundation.org.uk/sites/default/files/2021-09/Peas-Please-Veg-Facts-2021.pdf), the number of children eating little or no vegetables has increased in the last 10 years. Nearly a third of primary children eat less than one portion of vegetables a day. Research shows that if children enjoy eating healthy foods, they are more likely to eat them for life. Sensory food education can help address this, as evidence suggests it can increase children’s willingness to try new foods. 

## What are the principles of sensory food education?

Sensory food education takes place away from mealtimes, with a trusted adult and peers. Asking children open-ended questions, such as ''what does celery sound like?'' captures children’s innate curiosity and enables them to feel free to explore foods. 

TastEd specifically uses 2 golden rules to empower children:

- no one has to try
- no one has to like

This removes expectations and pressure to eat the foods, meaning children are more likely to try and potentially enjoy what’s on offer.

## Impact of sensory food education 

Feedback from practitioners suggests that sensory food education has many broad benefits for children, including:

- offering a simple, practical approach to healthy eating that actually changes children’s food choices
- aiding speech and language development
- encouraging children to try an increased diversity of fresh foods
- promoting a greater understanding of the world
- helping children to understand their likes and dislikes and respect those of others 
- enriching vocabulary 
- increasing self-confidence

Sensory food education also has benefits for practitioners, as it:

- offers fun activities to learn about food
- requires minimal equipment
- can be run using small amounts of fruit and vegetables
- connects well to activities such as gardening, cooking, books, and art  

## Advice for early years practitioners

Helping children broaden their food preferences and develop confidence in eating a healthy diet can be challenging. Here are some tips for practitioners. 

To support children’s sensory food education experience, you should:

- use the golden rules (''no one has to try'' and ''no one has to like'') as the basis for food experiences
- play simple sensory games, such as the [what’s in the socks game](https://www.tasteeducation.com/wp-content/uploads/2022/02/EYFS-Lesson-8-TOUCH-Whats-in-the-Sock_-Lesson-Plan-1.pdf), to engage even the most reluctant child
- get parents involved by telling them the foods their child explored and let them know if any preferences have changed as a result (for example ‘your child tried radishes today and actually liked them’)


You can teach children about how to use their senses to explore food by:

- modelling how to explore the food - such as sniffing foods, before trying them
- ensuring a child knows they don’t have to try the foods, but can use their other senses instead (licking is fine too!)
- using open questions so children can share their thoughts and discoveries, for example: ''What do you notice?'', ''How is it the same as...?'', ''What does it remind you of?''

## Food safety

It’s important to keep food safety in mind. You should ensure food for tasting is served in sizes and shapes appropriate for the child. You should also check for any allergies or intolerances before starting an activity. You can learn more about food safety and choking prevention in our [food safety article](https://help-for-early-years-providers.education.gov.uk/safeguarding-and-welfare/food-safety). 

## Further reading 

[Find simple, fun activities for your EY setting](https://www.tasteeducation.com/eyfs/) - TastEd 

[Learn more about how sensory food education is used around the world](https://www.sapere-association.com/about-us/sapere-members) - Sapere
', '2022-06-08 11:24:06.000552', '2023-04-12 10:06:55.183828', 31, 45, 47, 44, 't', 'Jenny Pendriss', '', '{:.contents-list__list}
* {:.contents-list__list-item .contents-list__list-item--dashed} [What is sensory food education?](#what-is-sensory-food-education)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Why do we need sensory food education?](#why-do-we-need-sensory-food-education)
* {:.contents-list__list-item .contents-list__list-item--dashed} [What are the principles of sensory food education?](#what-are-the-principles-of-sensory-food-education)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Impact of sensory food education](#impact-of-sensory-food-education)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Advice for early years practitioners](#advice-for-early-years-practitioners)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Food safety](#food-safety)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Further reading](#further-reading)', ''),
(47, 'Integrated reviews', 'integrated-reviews', '## The importance of early years provision for early childhood development 
 
The first 5 years of a child’s life are the most important years for health and wellbeing in adulthood.  
 
Every child’s development is unique. As a result, different children may appear more developed in some areas than others. 

Some children may need extra help in their early years setting to make similar progress to others. This could include children with less support at home, or those who have a special educational need or disability (SEND). 

## About integrated reviews 
 
The early years foundation stage (EYFS) [Progress check at age 2](https://www.gov.uk/government/publications/progress-check-at-age-2) and the [Healthy Child Programme](https://www.gov.uk/government/publications/healthy-child-programme-review-of-children-aged-2) review offer 2 opportunities to:  
 
- identify additional needs for children aged 2 to 3
- work in partnership with parents, carers, guardians and any relevant professionals to put the right support in place for the children who need it
 
Since 2015, the government has encouraged early years providers, local authorities, and health visiting services to work together to combine the Healthy Child Programme review and the EYFS Progress check at age 2. This is known as an ‘integrated review’. 

## Effective integrated reviews 

Integrated reviews take a variety of formats. There is no one size fits all solution. You  will need to adapt your approach to meet local needs and address local challenges in your area. However, good practice suggests that effective integrated reviews should bring together: 
 
- parents'', carers’ and guardians’ views, and any concerns about their child’s development 
 
- early years practitioners’ detailed knowledge of how the child is playing, learning and developing 
 
- health professionals’ expertise in the health and development of young children   

## Advice for early years practitioners 
 
Integrated reviews are most effective when professionals are clear about: 
 
- how each child will be reviewed
- who will review them
- what follow up support is available 
- how and when the impact of any support will be evaluated, so that no child ‘falls through the net’ 
 
You can support effective integrated reviews in several ways. We will explore these in more detail below.  
 
### Partnership working 
 
It is important to maintain positive partnerships with parents, carers and guardians. You can build understanding and trust with them by: 
 
- offering them meaningful opportunities to contribute to discussions about their child''s progress 
- listening to what they have to say 
 
You should also build and maintain partnerships with other specialists and health professionals. These partnerships should be in place before, during, and beyond the progress check. 
 
### Getting consent to share information 
 
At times, you may need to share information about a child with other relevant professionals. Before doing so, it is important you get permission from parents, carers or guardians. 
 
### Effective communication 
 
When children join the setting, you can encourage parents, carers and guardians to share their child''s personal health record. This is also known as a PCHR or ''red book''. You can use this as a tool to communicate between professionals about the child''s health and development. 

## Case study - Barnsley Local Authority Family Centre 
 
Barnsley Local Authority Family Centre delivers integrated services for children. The centre offers a variety of provision according to the needs of local families. It also has an on site nursery which is owned and managed by the local authority. This nursery offers sessional childcare for funded children only from the ages of 2 to 5. 

At the centre, a key person completed their key child’s 2 year progress check, when the child joined the setting in the term after their second birthday. During this check, the key person identified that the child’s progress was below expected levels of development against the prime areas of development. An integrated review gave an opportunity to understand this further.  


The integrated review involved: 

- the child''s parent
- the child’s key person
- the 0 to 19 Public Health Nursing Service (PHNS) Child Development Practitioner 

During the integrated review process, the child’s parent was able to share their concerns with the child’s key person and the health professional at the same time. This gave everyone a clear understanding of the child’s needs and how best to support them. The parent commented on how much easier it had been to have one single meeting, with both professionals offering advice and support. They also found having the child’s key person at the meeting reassuring when meeting unfamiliar health professionals.  

An Early Help Assessment was agreed at the integrated review meeting. This is a type of assessment completed with the help of the child’s family to: 

- identify the child’s strengths and needs
- agree what the family would like to change 
- develop an action plan 

^“The integrated review provided an opportunity to discuss concerns identified from the child’s 2 year progress check. Using a holistic approach with the family and health professional, we identified what support could be offered to the family. We completed an Early Help Assessment, referred to occupational therapy, and arranged for an Early Years Graduated Response to be completed. This helped to identify the child’s strengths and needs, as well as the support required for them and their family."<br><br> - Key person^


The key person recognised that the parent had felt comfortable sharing their concerns during this meeting. This then encouraged further discussions about the wider support the family might need. Involving both the child’s setting and a health professional in the integrated review created a supportive and emotionally safe environment for the parent. It also enabled early identification and timely intervention for the child and family. 


Following the integrated review, the family has benefited from: 

- a family support worker
- support with parental literacy skills
- guidance on the education, health and care plan (EHCP) and SEND processes


^“I am really happy with all the support and advice given from the family centre. I could not be happier.”<br><br> - Parent^
   
The child’s key person reflected that, through the integrated review process, parents gain a better picture of their child’s progress. They felt this was thanks to the consistency of messages and the holistic approach to the child’s development. They also emphasised that communication is critical for the success of the integrated 2 year review.

This example shows how the strong working relationships and regular communication between Barnsley Local Authority Family Centre, and the 0 to 19 Public Health Nursing Service, enables an equal partnership. In turn, this helps to ensure early intervention for children who need it.


## Benefits of integrated reviews 

[Research about pre-school’s influence on children’s development and attainment over time (PDF, 745 KB)](https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/455670/RB455_Effective_pre-school_primary_and_secondary_education_project.pdf.pdf) has shown that children who access high-quality early years provision are less likely to be identified as having a SEND in the long term. We as practitioners must be quick to support and identify the right help where needed.  

[DfE research (PDF,  1372 KB)](https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/376698/DFE-RR350_Integrated_review_at_age_two_implementation_study.pdf) has also shown that integrated review processes:  
 
- improve multi-agency working and information sharing to support families 

- reduce duplication 
 
- provide clearer and more consistent information for parents  
 
- offer a more holistic understanding of children’s needs 
 
- support earlier identification of need and earlier access to relevant support 
 
- contribute to improved outcomes for children, including school-readiness 


## Further reading and resources 
 
Doncaster Council offers advice for early years practitioners on [where to get help and support with childcare and early education](https://www.doncaster.gov.uk/services/schools/local-offer-early-years-and-childcare). This includes guidance and example forms for integrated reviews.
 
Essex County Council have created these [resources to help practitioners with integrated reviews](https://eycp.essex.gov.uk/the-early-years-foundation-stage/how-can-i-help-all-children-learn-and-progress/integrated-reviews/).

Barnsley Metropolitan Borough Council provides [guidance for integrated reviews](https://www.barnsley.gov.uk/services/children-families-and-education/childcare-nurseries-and-family-support/early-years-and-childcare-professionals/statutory-assessments/),  including templates and example reviews.

## About the authors 

Dr Julian Grenier is Headteacher at Sheringham Nursery School and Children’s Centre. Megan Pacey is Associate of Sheringham Nursery School and Children’s Centre.

Both Julian and Megan contributed to the Department for Education’s ‘Progress check at age 2’ guidance. ', '2023-04-06 09:34:51.561779', '2023-11-06 14:47:14.163306', 31, 46, 48, 46, 't', 'Jenny Pendriss', '', ' {:.contents-list__list}
* {:.contents-list__list-item .contents-list__list-item--dashed} [The importance of early years provision for early childhood development](#the-importance-of-early-years-provision-for-early-childhood-development)
* {:.contents-list__list-item .contents-list__list-item--dashed} [About integrated reviews](#about-integrated-reviews)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Effective integrated reviews](#effective-integrated-reviews)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Advice for early years practitioners](#advice-for-early-years-practitioners)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Case study - Barnsley Local Authority Family Centre](#case-study---barnsley-local-authority-family-centre)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Benefits of integrated reviews](#benefits-of-integrated-reviews)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Further reading and resources](#further-reading-and-resources)
* {:.contents-list__list-item .contents-list__list-item--dashed} [About the authors](#about-the-authors)', 'Get advice on how to carry out integrated health and education reviews for children aged 2 to 3. Integrated reviews combine the EYFS progress check at age 2 and the health visitor 2 year old health check.

By Dr Julian Grenier and Megan Pacey. With thanks to Barnsley Local Authority Family Centre and the 0 to 19 Public Health Nursing Service.'),
(48, 'Early years practitioner wellbeing support', 'early-years-practitioner-wellbeing-support', '## The importance of early years practitioner wellbeing

The early years workforce makes a huge contribution to young children’s lives, and a role in early years can be enjoyable and rewarding. However, it can also be a challenging and demanding career. As in any workplace, this can take a toll on an individual’s mental health and wellbeing. 

It is therefore essential that early years practitioners are properly supported within their setting to feel happy and fulfilled both inside and outside of work.  

Improving practitioner wellbeing practice can benefit both the individual practitioner, and the setting as a whole. This creates a positive environment for practitioners and children, which in turn can:  

- reduce absence 

 - increase effectiveness at work 

- improve practitioner retention  

Better practitioner wellbeing is also a factor in children’s personal, social and emotional development. This [staff wellbeing video](https://www.youtube.com/watch?v=-zlIeq3RQIE) from the Anna Freud National Centre for Children and Families explains how managing wellbeing can help you to develop stronger relationships with children and support their emotional regulation. This is particularly important if you work with children who have their own emotional difficulties.

## Early years practitioner wellbeing case studies

There are many ways in which practitioners’ wellbeing can be supported. In these case studies, early years leaders from four settings explain their approach to managing practitioner wellbeing.  These are real settings contacted by the Department for Education to share their experiences for this article.

### Tiger Tots Nursery

Tiger Tots Nursery is a private provider based in Kirkby in the Knowsley area of Liverpool.  The setting employs 25 members of staff. 

Managing Director Carol Copoc, Operations and Finance Director Dianne Copoc-Jones, and Training and Development Manager and Wellbeing Champion Jo Copoc share their insights on managing staff wellbeing within their setting:  

“At Tiger Tots Nursery we prioritise the mental, emotional and physical wellbeing of our practitioners and staff members. This has increased significantly over the past three years: we have gone from carrying out standard HR check-ups with employees to now carrying out regular monthly wellbeing checks which are delivered through our seven Wellbeing Champions. The champions have been trained through our own in-house programme and share tools and techniques to support all our staff – including the champions themselves, as wellness starts within. 

We are also supporting our staff to better recognise the signs of poor wellbeing in themselves, and to speak up if they are struggling. Discussing mental health is no longer a taboo subject, we want to break down those barriers. We operate an open-door policy so staff can feel free to discuss their emotions in a safe space.  

Our physical wellness practice includes mindfulness walks, Forest School, Yoga and Taekwondo. Supporting better nutrition and hydration is standard practice within the setting but something simple that also contributes to physical wellbeing.  

We have observed, following the pandemic, that separation anxiety in children has increased and it can take much longer for them to settle in. We need to ensure that staff are better equipped and resilient to be able to support children and their families, especially those who are vulnerable. 

Introducing strategies such as kindness, happiness, mindfulness, and fun has helped to make our workplace sustainable. We find that the more we support and invest in the self-regulation and wellbeing of our staff, the higher quality practice and the greater benefit we see for all our staff, children and families.”

###  Karla Roberts

“Wellbeing is a fundamental priority when working in early years. As a childminder, I can plan my day around my own needs and those of the children and other adults I work with. This ensures we can prioritise our own wellbeing. If we feel under the weather, for example, we can choose to have a slower paced day. I also plan a lot of time outdoors, which I know keeps myself, my assistants, and the children happy.   

Being able to compartmentalise is also a key skill. I think it’s very important that we don’t strive to be happy or perfect all the time. That’s a lot of pressure to deal with on an average working day. It’s also essential to not overcommit as a childminder. Keeping the day simple and organised is the best way to maintain a sense of calm.  

Professional support is also necessary. As childminders we often work alone, so talking to others is the best thing we can do to prevent feeling isolated. Engaging via informal groups online creates a supportive environment within the sector and brings us together. This means we can discuss the stress of the role with someone who understands, as well as share best practice.”

### Ark Start

Ark Start is a school-based nursery. It operates from two Ark schools in London: Ark John Archer Primary Academy in Battersea and Ark Start Oval in Croydon. Ark Start employs around 20 practitioners across both settings.  

Director Katie Oliver says: 

“We believe that high quality leadership and management are essential to ensure that the structure of our setting promotes good staff wellbeing.  

For instance, we try to limit the amount of admin staff must do. This allows them to focus on their role as educators. We schedule time for necessary tasks within their working hours, but keep it separate from the time they have with the children.  

We also conduct termly anonymous staff surveys, with specific questions about staff wellbeing. This helps to keep management informed and allows staff to voice how they are feeling. Making sure staff feel valued is fundamental to a positive work environment – and it’s free. As part of this, we refer to all our staff as educators. We hope that this creates a culture where there is no hierarchy, and everyone feels respected.  

We are also committed to supporting the professional development and continuous learning of our staff. We want to ensure they feel we invest in them, so we schedule in time specifically for this purpose. This takes many forms, including online and in-person training. We also visit other settings to learn about practice in different environments.”

### Selby Cottage Childcare Centre

Selby Cottage Childcare Centre is one of five nurseries run by Durham County Council. It is situated in Chester-le-Street in the North East of England and employs 19 members of staff. 

Childcare Development Officer and Area Manager Kath Lowery says: 

“Across our nurseries, it’s a priority that we nurture our staff. It’s not about grand gestures or things that cost a lot of money. It’s more about investing in and embedding a consistent culture of support and noticing the little things that our colleagues might need help with. For example, simple daily habits like checking in with the teams’ wellbeing or just making a cup of tea. 

We strive to support our staff to have a good work-life balance, ensuring they don’t miss important family moments such as sports days or nativity shows, and offering special personalised gestures. 

We actively encourage the team to bring their own interests and passions to work. For example, we have a staff member who has a keen interest in animal welfare who has taught the children so much about caring for animals. 

Working in early years is so broad: one day we might be doing a beach visit or forest school - the next we might be leading an intervention for children. So, it’s important for us to support practitioner wellbeing, and we spend a lot of time inducting new staff and students so that they feel part of our community.  

Nurturing wellbeing is a year-round responsibility, but we run a dedicated wellbeing week each year, with activities such as a sea swim, yoga sessions or lunch together around a campfire. 

It’s important that our practitioners see the leadership team as a positive role model demonstrating guidance and empathy – this is ultimately how we want our team to be with the children in our care. The emotional environment is so important for children as well as adults – it’s got to be right for the children to learn and thrive. We want our nurseries to be a happy place for everyone.”

## Support for early years practitioners

If you are struggling with your mental health or wellbeing, you may wish to discuss your concerns with your line manager or another colleague within your setting in the first instance. If you want support from someone outside of your workplace, the following links may be helpful. 

 The [Hub of Hope](https://hubofhope.co.uk) is a mental health support directory provided by Chasing the Stigma which signposts to local, regional and national services offering support on a wide range of topics including bereavement, anxiety and loneliness. 

[Education Support](https://www.educationsupport.org.uk/get-help/help-for-you/helpline) offers a free emotional support helpline for everyone working in education, including early years. It is open 24 hours a day, 7 days a week, and you will speak to a qualified counsellor. You can [contact Education Support](https://www.educationsupport.org.uk/about/about-us/contact-us) by phone, text, online live chat or email. 

Education Support’s guide to [the building blocks of good mental wellbeing](https://www.educationsupport.org.uk/resources/for-individuals/guides/the-building-blocks-of-good-mental-wellbeing/) includes advice on exercise, eating well and developing good sleep habits. 

[Every Mind Matters](https://www.nhs.uk/every-mind-matters) provides a source of expert advice to help you and your staff look after your mental health. This includes practical tips that you can build into your daily routine. 

The [Every Mind Matters self-care tool](https://campaignresources.phe.gov.uk/schools/resources/every-mind-matters-self-care-tool) creates a personalised mental health action plan, with tips and advice to help you be kind to your mind.

## Workplace toolkits and resources for managers

If you are an early years leader or manager, these resources may offer ideas to help you implement wellbeing support and practice in your setting.   

 The Anna Freud Centre’s [early years staff wellbeing resource for managers](https://www.annafreud.org/resources/under-fives-wellbeing/early-years-staff-wellbeing-a-resource-for-managers-and-teams) and teams includes advice on how to support your staff through management, planning meetings on wellbeing, and facilitating support from outside your setting.     

 The Anna Freud Centre and Child Outcomes Research Consortium have created a [wellbeing measurement for early years settings](https://www.annafreud.org/resources/under-fives-wellbeing/wellbeing-measurement-for-early-years-settings/#:~:text=Wellbeing%20measurement%20in%20early%20years%20settings,-Dr%20Abi%20Miranda&text=Our%20Wellbeing%20measurement%20for%20early,measure%20wellbeing%20robustly%20and%20consistently). This is a survey that you can use to better understand your staff’s wellbeing and how to offer support.  

 Foundation Years have published a [vodcast on mental health and wellbeing](https://foundationyears.org.uk/2022/07/foundation-years-vodcast-on-staff-mental-health-and-wellbeing). They also offer presentations that focus on [putting wellbeing at the heart of early years practice](https://foundationyears.org.uk/2020/12/putting-wellbeing-at-the-heart-of-our-early-years-practice/).

National Day Nurseries Association has developed an adaptable [wellbeing policy template for nurseries](https://ndna.org.uk/product/staff-well-being-england). This is free of charge to all nursery settings.    

$CTA

**Get alerts for new EYFS resources**

[Sign up to get emails when we add new early years foundation stage resources to this website](https://docs.google.com/forms/d/e/1FAIpQLSdZbPz-447CADTErT9eD1IU4yKfsEhyJy1C8U1fyFAQuEtejw/viewform?usp=sf_link)

$CTA
      
       ', '2023-11-03 09:16:18.232816', '2023-11-06 14:47:14.172191', 31, 47, 41, 47, 't', 'Michaela Chirgwin', '', '{:.contents-list__list}
* {:.contents-list__list-item .contents-list__list-item--dashed} 
[The importance of early years practitioner wellbeing](#the-importance-of-early-years-practitioner-wellbeing)
* {:.contents-list__list-item .contents-list__list-item--dashed} 
[Early years practitioner wellbeing case studies](#early-years-practitioner-wellbeing-case-studies)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Support for early years practitioners](#support-for-early-years-practitioners)
* {:.contents-list__list-item .contents-list__list-item--dashed} [Workplace toolkits and resources for managers](#workplace-toolkits-and-resources-for-managers)', 'Get ideas on how to support the mental health and wellbeing of yourself and other practitioners working in your early years setting.  ');
