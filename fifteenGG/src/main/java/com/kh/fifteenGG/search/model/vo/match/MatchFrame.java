/*
 * Copyright 2014 Taylor Caldwell
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.kh.fifteenGG.search.model.vo.match;


import java.io.Serializable;
import java.util.List;
import java.util.Map;

public class MatchFrame implements Serializable {

	private static final long serialVersionUID = 4359409042534560829L;

	private long gameId;
	private List<MatchEvent> events;
	private Map<Integer, MatchParticipantFrame> participantFrames;
	private long timestamp;

	public static long getSerialVersionUID() {
		return serialVersionUID;
	}

	public long getGameId() {
		return gameId;
	}

	public void setGameId(long gameId) {
		this.gameId = gameId;
	}

	public void setEvents(List<MatchEvent> events) {
		this.events = events;
	}

	public void setParticipantFrames(Map<Integer, MatchParticipantFrame> participantFrames) {
		this.participantFrames = participantFrames;
	}

	public void setTimestamp(long timestamp) {
		this.timestamp = timestamp;
	}

	public List<MatchEvent> getEvents() {
		return events;
	}

	public Map<Integer, MatchParticipantFrame> getParticipantFrames() {
		return participantFrames;
	}

	public long getTimestamp() {
		return timestamp;
	}

	@Override
	public String toString() {
		return "MatchFrame{" +
				"gameId=" + gameId +
				", events=" + events +
				", participantFrames=" + participantFrames +
				", timestamp=" + timestamp +
				'}';
	}
}