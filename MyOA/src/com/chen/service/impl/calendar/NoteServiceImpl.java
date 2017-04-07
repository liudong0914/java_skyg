package com.chen.service.impl.calendar;



import com.chen.dao.calendar.NoteDao;
import com.chen.entity.Mynote;
import com.chen.service.calendar.NoteService;
import com.chen.service.impl.BaseServiceImpl;


/**
 * 便签Service实现类
 * @author TCJ
 *
 */
public class NoteServiceImpl extends BaseServiceImpl<Mynote, Integer> implements
		NoteService {

		private NoteDao noteDao;

		public void setNoteDao(NoteDao noteDao) {
			this.noteDao = noteDao;
			super.setBaseDao(noteDao);
		}
		
		
}
